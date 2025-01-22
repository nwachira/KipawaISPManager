<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no" />
    <title>{$_title}</title>
    <link rel="shortcut icon" href="favicon.ico">
    <script type="text/javascript" src="system/plugin/speedtest.js"></script>
    {literal}
    <script type="text/javascript">

        //INITIALIZE SPEEDTEST
        var s = new Speedtest(); //create speedtest object
        s.onupdate = function (data) { //callback to update data in UI
           // I("ip").textContent = data.clientIp;
            I("dlText").textContent = (data.testState == 1 && data.dlStatus == 0) ? "..." : data.dlStatus;
            I("ulText").textContent = (data.testState == 3 && data.ulStatus == 0) ? "..." : data.ulStatus;
            I("pingText").textContent = data.pingStatus;
            I("jitText").textContent = data.jitterStatus;
            var prog = (Number(data.dlProgress) * 2 + Number(data.ulProgress) * 2 + Number(data.pingProgress)) / 5;
            I("progress").style.width = (100 * prog) + "%";
        }
        s.onend = function (aborted) { //callback for test ended/aborted
            I("startStopBtn").className = ""; //show start button again
            if (aborted) { //if the test was aborted, clear the UI and prepare for new test
                initUI();
            }
        }

        function startStop() { //start/stop button pressed
            if (s.getState() == 3) {
                //speedtest is running, abort
                s.abort();
            } else {
                //test is not running, begin
                s.start();
                I("startStopBtn").className = "running";
            }
        }

        //function to (re)initialize UI
        function initUI() {
            I("dlText").textContent = "";
            I("ulText").textContent = "";
            I("pingText").textContent = "";
            I("jitText").textContent = "";
            I("ip").textContent = "";
        }

        function I(id) { return document.getElementById(id); }
    </script>{/literal}

    <style type="text/css">
        html,
        body {
            border: none;
            padding: 0;
            margin: 0;
            background: #FFFFFF;
            color: #202020;
        }

        body {
            text-align: center;
            font-family: "Roboto", sans-serif;
        }

        h1 {
            color: #404040;
        }

        #startStopBtn {
            display: inline-block;
            margin: 0 auto;
            color: #6060AA;
            background-color: rgba(0, 0, 0, 0);
            border: 0.15em solid #6060FF;
            border-radius: 0.3em;
            transition: all 0.3s;
            box-sizing: border-box;
            width: 8em;
            height: 3em;
            line-height: 2.7em;
            cursor: pointer;
            box-shadow: 0 0 0 rgba(0, 0, 0, 0.1), inset 0 0 0 rgba(0, 0, 0, 0.1);
        }

        #startStopBtn:hover {
            box-shadow: 0 0 2em rgba(0, 0, 0, 0.1), inset 0 0 1em rgba(0, 0, 0, 0.1);
        }

        #startStopBtn.running {
            background-color: #FF3030;
            border-color: #FF6060;
            color: #FFFFFF;
        }

        #startStopBtn:before {
            content: "Start";
        }

        #startStopBtn.running:before {
            content: "Abort";
        }

        #test {
            margin-top: 2em;
            margin-bottom: 12em;
        }

        div.testArea {
            display: inline-block;
            width: 14em;
            height: 9em;
            position: relative;
            box-sizing: border-box;
        }

        div.testName {
            position: absolute;
            top: 0.1em;
            left: 0;
            width: 100%;
            font-size: 1.4em;
            z-index: 9;
        }

        div.meterText {
            position: absolute;
            bottom: 1.5em;
            left: 0;
            width: 100%;
            font-size: 2.5em;
            z-index: 9;
        }

        #dlText {
            color: #6060AA;
        }

        #ulText {
            color: #309030;
        }

        #pingText,
        #jitText {
            color: #AA6060;
        }

        div.meterText:empty:before {
            color: #505050 !important;
            content: "0.00";
        }

        div.unit {
            position: absolute;
            bottom: 2em;
            left: 0;
            width: 100%;
            z-index: 9;
        }

        div.testGroup {
            display: inline-block;
        }

        @media all and (max-width:65em) {
            body {
                font-size: 1.5vw;
            }
        }

        @media all and (max-width:40em) {
            body {
                font-size: 0.8em;
            }

            div.testGroup {
                display: block;
                margin: 0 auto;
            }
        }

        #progressBar {
            width: 90%;
            height: 0.3em;
            background-color: #EEEEEE;
            position: relative;
            display: block;
            margin: 0 auto;
            margin-bottom: 2em;
        }

        #progress {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0%;
            transition: width 2s;
            background-color: #90BBFF;
        }
    </style>
</head>

<body>
    <h1>{$_title}</h1>
    <div id="test">
        <div id="progressBar">
            <div id="progress"></div>
        </div>
        <div class="testGroup">
            <div class="testArea">
                <div class="testName">Download</div>
                <div id="dlText" class="meterText"></div>
                <div class="unit">Mbit/s</div>
            </div>
            <div class="testArea">
                <div class="testName">Upload</div>
                <div id="ulText" class="meterText"></div>
                <div class="unit">Mbit/s</div>
            </div>
        </div>
        <div class="testGroup">
            <div class="testArea">
                <div class="testName">Ping</div>
                <div id="pingText" class="meterText"></div>
                <div class="unit">ms</div>
            </div>
            <div class="testArea">
                <div class="testName">Jitter</div>
                <div id="jitText" class="meterText"></div>
                <div class="unit">ms</div>
            </div>
        </div><br><br>
        <div id="ipArea">
            <div id="startStopBtn" onclick="startStop()"></div>
        </div>
    </div>
    <a class="button" href="{$_url}home">{Lang::T('Go Back')}</a>
    {literal}<script type="text/javascript">
        initUI();
    </script>{/literal}
</body>

</html>