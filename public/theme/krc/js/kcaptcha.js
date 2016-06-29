$(function(){
    var mp3_url = "";

    $(document).on( "click", "#captcha_reload", function(){
        $.ajax({
            type: 'POST',
            url: g5_captcha_url+'/kcaptcha_session.php',
            cache: false,
            async: false,
            success: function(text) {
                $('#captcha_img').attr('src', g5_captcha_url+'/kcaptcha_image.php?t=' + (new Date).getTime());
            }
        });

        $.ajax({
            type: 'POST',
            url: g5_captcha_url+'/kcaptcha_mp3.php',
            cache: false,
            async: false,
            success: function(url) {
                if (url) {
                    mp3_url = url + "?t="+new Date().getTime();
                    $("#captcha_audio").attr("src", mp3_url);
                }
            }
        });
    });

    $(document).on( "click", "#captcha_mp3", function(){
        $("body").css("cursor", "wait");

        $.ajax({
            type: 'POST',
            url: g5_captcha_url+'/kcaptcha_mp3.php',
            cache: false,
            async: false,
            success: function(url) {
                if (url) {
                    mp3_url = url + "?t="+new Date().getTime();
                }
            }
        });

        var html5use = false;
        var html5audio = document.createElement("audio");
        if (html5audio.canPlayType && html5audio.canPlayType("audio/mpeg")) {
            var wav = new Audio(mp3_url);
            wav.id = "mp3_audio";
            wav.autoplay = true;
            wav.controls = false;
            wav.autobuffer = false;
            wav.loop = false;

            if ($("#mp3_audio").length) $("#mp3_audio").remove();
            $("#captcha_mp3").after(wav);

            html5use = true;
        }

        if (!html5use) {
            var object = '<object id="mp3_object" classid="clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95" height="0" width="0" style="width:0; height:0;">';
            object += '<param name="AutoStart" value="1" />';
            object += '<param name="Volume" value="0" />';
            object += '<param name="PlayCount" value="1" />';
            object += '<param name="FileName" value="' + mp3_url + '" />';
            object += '<embed id="mp3_embed" src="' + mp3_url + '" autoplay="true" hidden="true" volume="100" type="audio/x-wav" style="display:inline;" />';
            object += '</object>';
            if ($("#mp3_object").length)
                $("#mp3_object").remove();
            $("#captcha_mp3").after(object);
        }

        $("body").css("cursor", "default");
        return false;

    }).css('cursor', 'pointer');

    $("#captcha_reload").trigger("click");
});

// 異쒕젰�� 罹≪콬�대�吏��� �ㅺ컪怨� �낅젰�� �ㅺ컪�� 媛숈�吏� 鍮꾧탳�쒕떎.
function chk_captcha()
{
    var captcha_result = false;
    var captcha_key = document.getElementById('captcha_key');
    $.ajax({
        type: 'POST',
        url: g5_captcha_url+'/kcaptcha_result.php',
        data: {
            'captcha_key': captcha_key.value
        },
        cache: false,
        async: false,
        success: function(text) {
            captcha_result = text;
        }
    });

    if (!captcha_result) {
        alert('�먮룞�깅줉諛⑹� �낅젰 湲��먭� ���멸굅�� �낅젰 �잛닔媛� �섏뿀�듬땲��.\n\n�덈줈怨좎묠�� �대┃�섏뿬 �ㅼ떆 �낅젰�� 二쇱떗�쒖삤.');
        captcha_key.select();
        captcha_key.focus();
        return false;
    }

    return true;
}