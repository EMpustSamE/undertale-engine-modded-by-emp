function Event_Init(){
	global.event_map = ds_map_create();

	enum EVENT_TYPE {
	    FUNCTION,
	    SLEEP,
	    DIALOG,
	    CHARMOVE
	}
}

function Event_GetQueue(key) {
    if (!ds_map_exists(global.event_map, key)) {
        var queue = {
            events: ds_list_create(),
            index: 0,
            active: false,
            paused: false,
            current_data: undefined
        };
        ds_map_add(global.event_map, key, queue);
    }
    return ds_map_find_value(global.event_map, key);
}

function Event_Function(key, func) {
    var queue = Event_GetQueue(key);
    ds_list_add(queue.events, {
        type: EVENT_TYPE.FUNCTION,
        func: func
    });
}

function Event_Sleep(key, frames) {
    var queue = Event_GetQueue(key);
    ds_list_add(queue.events, {
        type: EVENT_TYPE.SLEEP,
        frames: frames
    });
}

function Event_Dialog(key, string) {
    var queue = Event_GetQueue(key);
    ds_list_add(queue.events, {
        type: EVENT_TYPE.DIALOG,
        string: string
    });
}

function Event_CharMove(key, obj, dir, dist) {
    var queue = Event_GetQueue(key);
    ds_list_add(queue.events, {
        type: EVENT_TYPE.CHARMOVE,
        obj: obj,
        dir: dir,
        dist: dist
    });
}

function Event_Play(key) {
    var queue = Event_GetQueue(key);
    queue.active = true;
    queue.paused = false;
    queue.index = 0;
    queue.current_data = undefined;
}

function Event_Pause(key) {
    var queue = Event_GetQueue(key);
    queue.paused = true;
}

function Event_Step() {
    var _map = global.event_map;
    var _keys = ds_list_create();

    var _current_key = ds_map_find_first(_map);
    while (!is_undefined(_current_key)) {
        ds_list_add(_keys, _current_key);
        _current_key = ds_map_find_next(_map, _current_key);
    }
    
    for (var i = 0; i < ds_list_size(_keys); i++) {
        var _key = ds_list_find_value(_keys, i);
        var _queue = ds_map_find_value(_map, _key);

        if (!_queue.active || _queue.paused || ds_list_size(_queue.events) == 0) continue;

        var _event = ds_list_find_value(_queue.events, _queue.index);

        if (_queue.index >= ds_list_size(_queue.events)) {
            _queue.active = false;
        }
    }
    
    ds_list_destroy(_keys);
}