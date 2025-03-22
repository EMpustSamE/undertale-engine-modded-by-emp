/*// ======================
// Core of Event system
// ======================

// Init the global event list
function Event_Init(){
	global.events = [];
}

// Create a new event object
function Event_Create() {
    return {
        functions: [],   // 存储步骤方法数组
        delays: [],      // 步骤间延迟帧数
        currentIndex: 0, // 当前执行步骤索引
        timer: 0,        // 步骤执行计时器
        active: false,   // 是否激活状态
        paused: false,   // 暂停状态
        lastInitIndex: -1// 上次执行初始化的步骤索引
    };
}

// 核心添加功能方法（统一入口）
function Event_AddFunction(target_event, init_func, update_func, delay = 0) {
    array_push(target_event.functions, {
        init: init_func,
        update: update_func ?? function() { return true; }
    });
    array_push(target_event.delays, delay);
    return true;
}

// ======================
// 专用事件类型封装
// ======================

// 添加对话步骤
function Event_Dialog(target_event, text) {
    return Event_AddFunction(target_event,
        method({ text: text }, function() {
            if is_array(text) {
                for(var i=0; i<array_length(text); i++) {
                    Dialog_Add(text[i]);
                }
            } else {
                Dialog_Add(text);
            }
            Dialog_Start();
        }),
        method({}, function() {
            return !instance_exists(ui_dialog); // 自定义对话框活动检测函数
        })
    );
}

// 添加选项步骤
function Event_Choice(target_event, text, callback) {
    return Event_AddFunction(target_event,
        // 初始化阶段：添加带选择标记的文本
        method({ text: text }, function() {
            Dialog_Add(self.text + "{choice `TMP`}");    // 假设自动解析{choice}标记
            Dialog_Start();           // 自动触发选项显示
        }),
        
        // 更新检测阶段：等待选择完成
        method({ callback: callback }, function() {
            // 当对话框关闭且已获得选择时
            if (!instance_exists(ui_dialog) && Player_GetTextTyperChoice() != -1) {
                var result = Player_GetTextTyperChoice();
                self.callback(result);
                return true; // 完成步骤
            }
            return false;
        })
    );
}

// 添加战斗遭遇
function Event_Encounter(target_event, battle_id, anim=true, surprise=false) {
    return Event_AddFunction(target_event,
        method({ battle_id: battle_id, anim: anim, surprise: surprise }, function() {
            Encounter_Start(battle_id, anim, surprise);
        }),
        method({}, function() {
            return !room == room_battle; // 自定义战斗活动检测
        })
    );
}

// 添加角色移动
function Event_CharMove(target_event, char_obj, direction, steps) {
    return Event_AddFunction(target_event,
        method({ char: char_obj, dir: direction, steps: steps }, function() {
            self.char.move[self.dir] = self.steps;
        }),
        method({ char: char_obj, dir: direction }, function() {
            return (self.char.move[self.dir] == 0);
        })
    );
}

// 添加等待时间（修复版）
function Event_AddSleep(target_event, frames) {
    return Event_AddFunction(target_event,
        method({ frames: frames }, function() {
            self.timer = self.frames; // 直接操作父级事件对象
        }),
        method({}, function() {
            return (self.timer <= 0); // 通过事件对象的timer控制
        }),
        frames
    );
}

// ======================
// 事件控制逻辑
// ======================

// 添加事件
function Event_Push(event) {
	if !is_struct(event) {
        show_debug_message("Error:Trying to add an non-event object");
        return false;
    }
    // 防止重复添加
    //if (array_get(global.events, event) == -1) {
        array_push(global.events, event);
    //}
    return true; // 保持与原始代码兼容性
}

// 启动事件
function Event_Start(target_event) {
    target_event.currentIndex = 0;
    target_event.timer = 0;
    target_event.active = true;
    target_event.paused = false;
    target_event.lastInitIndex = -1;
}

// 暂停事件
function Event_Pause(target_event) {
    target_event.paused = true;
}

// 恢复事件
function Event_Resume(target_event) {
    target_event.paused = false;
}

// 停止事件
function Event_Stop(target_event) {
    target_event.active = false;
    array_delete(global.events, global.events[target_event], 1);
}

// 全局执行步进
function Event_Step() {
    for(var i=array_length(global.events)-1; i>=0; i--) {
        var ev = global.events[i];
        if(!ev.active || ev.paused) continue;

        if(ev.timer > 0) {
            ev.timer--;
            continue;
        }

        if(ev.currentIndex >= array_length(ev.functions)) {
            Event_Stop(ev);
            continue;
        }

        var step = ev.functions[ev.currentIndex];
        
        // 执行初始化
        if(ev.lastInitIndex != ev.currentIndex) {
            script_execute(step.init);
            ev.lastInitIndex = ev.currentIndex;
        }

        // 检测完成状态
        if(script_execute(step.update)) {
            ev.timer = ev.delays[ev.currentIndex];
            ev.currentIndex++;
        }
    }
}
