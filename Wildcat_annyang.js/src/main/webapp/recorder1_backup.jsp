<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <title>Speech to Text</title>
     <style>
         body{
             text-align: center;
         }

        button{
             padding: 8px;
             /*border-radius: 6px;*/
         }
         #message {
             color: #996600;
         }

        .textWrapper{
             width: 800px;
             margin: 0 auto;
             display: flex;
             flex-direction: row;
         }
         .textbox{
             height: 100px;
             border: 1px solid #d3d3d3;
             flex: 1;
             margin : 5px 15px;
             border-radius: 6px;
             text-align: left;
             padding: 16px;
         }
     </style>
     <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
     <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script> -->
</head>
<body>

    <h1>Speech to Text Example!!!</h1>

    <button id="speech" onclick="speech_to_text()">Start STT</button>
     <button id="stop" onclick="stop()">Stop</button>
     <p id="message">버튼을 누르고 아무말이나 하세요.</p>

    <div class="textWrapper">
         <div id="korea" class="textbox"></div>
         <div id="english" class="textbox"></div>
     </div>

    <script type="text/javascript">

        var message = document.querySelector("#message");
         var button = document.querySelector("#speech");
         var korea = document.querySelector("#korea");
         var english = document.querySelector("#english");
         var isRecognizing = false;

        if ('SpeechRecognition' in window) {
           // Speech recognition support. Talk to your apps!
           console.log("음성인식을 지원하는 브라우저입니다.")
         }

        try {
             var recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition || window.mozSpeechRecognition || window.msSpeechRecognition)();
         } catch(e){
             console.error(e);
         }

        recognition.lang = 'ko-KR'; //선택하게 해줘야 할듯 .
         recognition.interimResults = false;
         recognition.maxAlternatives = 5;
         //recognition.continuous = true;


         function speech_to_text(){
            
             recognition.start();
             isRecognizing = true;

            recognition.onstart = function(){
                 console.log("음성인식이 시작 되었습니다. 이제 마이크에 무슨 말이든 하세요.")
                 message.innerHTML = "음성인식 시작...";
                 button.innerHTML = "Listening...";
                 button.disabled = true;
             }
            

            recognition.onspeechend = function(){
                 message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
                 button.disabled = false;
                 button.innerHTML = "Start STT";
             }

            recognition.onresult = function(event) {
                 console.log('You said: ', event.results[0][0].transcript);
                 // 결과를 출력
                 var resText = event.results[0][0].transcript;
                 korea.innerHTML = resText;

                //text to sppech
                 text_to_speech(resText);
                
             };

            recognition.onend = function(){
                 message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
                 button.disabled = false;
                 button.innerHTML = "Start STT";
                 isRecognizing = false;

            }
         }

        function stop(){
             recognition.stop();
             message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
             button.disabled = false;
             button.innerHTML = "Start STT";
             isRecognizing = false;
         }


        // Text to speech
         function text_to_speech(txt){
             // Web Speech API - speech synthesis
             if ('speechSynthesis' in window) {
              // Synthesis support. Make your web apps talk!
                  console.log("음성합성을 지원하는  브라우저입니다.");
             }
             var msg = new SpeechSynthesisUtterance();
             var voices = window.speechSynthesis.getVoices();
             //msg.voice = voices[10]; // 두번째 부터 완전 외국인 발음이 됨. 사용하지 말것.
             msg.voiceURI = 'native';
             msg.volume = 1; // 0 to 1
             msg.rate = 1.3; // 0.1 to 10
             //msg.pitch = 2; //0 to 2
             msg.text = txt;
             msg.lang = 'ko-KR';

            msg.onend = function(e) {
                 if(isRecognizing == false){
                     recognition.start();   
                 }
                   console.log('Finished in ' + event.elapsedTime + ' seconds.');
             };
             window.speechSynthesis.speak(msg);
         }

    </script>

</body>
</html>