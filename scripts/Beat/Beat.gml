function Beat(_bpm, _offset = 0, _frameRate = 60) constructor {
    self.bpm = _bpm;
    self.offset = _offset;
    self.frameRate = _frameRate;

    function bpmToFrames(Bpm) {
        var secondsPerBeat = 60 / self.bpm;
        var framesPerBeat = secondsPerBeat * self.frameRate * Bpm;
        var offsetFrames = self.offset * self.frameRate;
        return framesPerBeat + offsetFrames;
    }

    function framesToBpm(_frames) {
        var offsetFrames = self.offset * self.frameRate;
        var adjustedFrames = _frames - offsetFrames;
        var secondsPerBeat = adjustedFrames / self.frameRate;
        var bpm = 60 / secondsPerBeat;
        return bpm;
    }
}