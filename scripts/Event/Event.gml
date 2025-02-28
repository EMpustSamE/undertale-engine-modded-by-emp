function Event_Init(){
	global.event_map = ds_map_create();

	enum EVENT_TYPE {
	    FUNCTION,
	    SLEEP,
	    DIALOG,
	    CHARMOVE,
	    CHOICE
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

function Event_Choice(key, text, choice_str, callback) {
    var queue = Event_GetQueue(key);
    
    var _final_text = text + "&&" + choice_str + "{choice `TMP`}";
    
    ds_list_add(queue.events, {
        type: EVENT_TYPE.CHOICE,
        text: _final_text,
        callback: callback,
        event_key: key, // 存储事件键
        completed: false
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
		
		switch (_event.type) {
            case EVENT_TYPE.FUNCTION:
                _event.func();
                _queue.index++;
                break;
                
            case EVENT_TYPE.SLEEP:
                if (is_undefined(_queue.current_data)) {
                    _queue.current_data = {
                        frames_remaining: _event.frames
                    };
                }
                _queue.current_data.frames_remaining--;
                if (_queue.current_data.frames_remaining <= 0) {
                    _queue.index++;
                    _queue.current_data = undefined;
                }
                break;
                
            case EVENT_TYPE.DIALOG:
                if (is_undefined(_queue.current_data)) {
                    Dialog_Add(_event.string);
					Dialog_Start();
                    _queue.current_data = { dialog_active: true };
                }
                if (!instance_exists(ui_dialog)) {
                    _queue.index++;
                    _queue.current_data = undefined;
                }
                break;
                
			case EVENT_TYPE.CHOICE:
        if (is_undefined(_queue.current_data)) {
            Dialog_Add(_event.text);
            Dialog_Start();
            _queue.current_data = { started: true };
            return;
        }
        
        if (!instance_exists(ui_dialog) && !_event.completed) {
            var _choice = Player_GetTextTyperChoice();
            // 传递 _key 和 _choice
            _event.callback(_event.event_key, _choice);
            _event.completed = true;
            _queue.index++;
            _queue.current_data = undefined;
        }
        break;
				
            case EVENT_TYPE.CHARMOVE:
                var _obj = _event.obj;
                var _dir = _event.dir;
                var _dist = _event.dist;

                if (is_undefined(_queue.current_data)) {
                    _obj.move[_dir] = _dist;
                    _queue.current_data = { initialized: true };
                }

                if (_obj.move[_dir] <= 0) {
                    _queue.index++;
                    _queue.current_data = undefined;
                }
                break;
        }

        if (_queue.index >= ds_list_size(_queue.events)) {
            _queue.active = false;
        }
    }
    
    ds_list_destroy(_keys);
}