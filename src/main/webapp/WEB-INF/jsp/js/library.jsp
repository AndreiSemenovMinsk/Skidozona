<%@ page contentType="text/html;charset=utf-8" language="java" %>

<audio id="sound1">
		<source src="images/sound.wav" type="audio/wav">
</audio>

<script type="text/javascript">
/**
 *
 */
 function createObject() {
	 var request_type;
	 var browser = navigator.appName;
	 if(browser == "Microsoft Internet Explorer"){
	 request_type = new ActiveXObject("Microsoft.XMLHTTP");
	 } else {
	 request_type = new XMLHttpRequest();
	 }
	 return request_type;
	 }
	 var http = createObject();
	 /* -------------------------- */
	 /*        SEARCH              */
	 /* -------------------------- */
	 
	 
function signIn(login, pass)
{
if (login == '') console.log(' Не заполнен логин!');
	else
	if (pass == '') console.log(' На заполнен пароль!');
	else
	{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=sign_in&login='+login+'&password='+pass);
	http.onreadystatechange =  responseSignIn;
	http.send(null);
	}
}

function responseSignIn(){

	if(http.readyState == 4)
	{
		resp = http.responseText;
		
		console.log("responseSignIn "+resp);

		arrResp = resp.split("@");

		if (arrResp[0]=='0'){

			rand = arrResp[1];

			document.getElementById('login').style.display = 'none';

			document.getElementById('vhod').innerHTML = '<a>'+exit+' </a>';

			var current_date = new Date;
		    var cookie_year = current_date.getFullYear() + 1;
		    var cookie_month = current_date.getMonth();
		    var cookie_day = current_date.getDate();
		    set_cookie( 'session_id', rand, cookie_year, cookie_month, cookie_day );

		    //viewBooks();
		    PlaySound('sound1');//sound();
		    
console.log(arrResp);

		    if (arrResp.length > 2 && arrResp[2]=='5'){
		    	window.location.href = "http://localhost:8159/Eximer/Controller?command=admin";
		    } else {
		    	
		    }
		}
	}
}

var let_parol = false;

var login_msg, parol_msg;

function test_parol( parol)
{
	if (parol.length < 5)
	{
	document.getElementById('test_parol').innerHTML = '<font color=red> Пароль должен иметь не менее 5 знаков </font><br>';
	parol_msg = 'Логин должен иметь не менее 5 знаков!';
	let_parol = false;
	}
		else
	if (parol.slice(0, 5) == '12345' ||
			parol.slice(0, 5) == '11111' ||
			parol.slice(0, 5) == '22222' ||
			parol.slice(0, 5) == '33333' ||
			parol.slice(0, 5) == '55555' ||
			parol.slice(0, 5) == 'parol' ||
			parol.slice(0, 5) == 'passw' ||
			parol.slice(0, 5) == 'paswo')
	{
	document.getElementById('test_parol').innerHTML = '<font color=red> Пароль должен быть сложным </font><br>';
	parol_msg = 'Логин должен быть сложным!';
	let_parol = false;
	}
	else
	if( parol.search(/[А-яЁё]/) !== -1 )
	{
	document.getElementById('test_parol').innerHTML = '<font color=red> В пароле не должно быть кирилических символов </font><br>';
	parol_msg = 'В логине не должно быть кирилических символов!';
	let_parol = false;
	}
		else
	{
	document.getElementById('test_parol').innerHTML = 'Пароль подходит!';
	parol_msg = '';
	let_parol = true;
	}
}

var let_login = false;

function test_login( login)
{
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=test_login&login='+login);
	http.onreadystatechange =  test_login_resp;
	http.send(null);
}

function test_login_resp()
{
	if(http.readyState == 4)
	{
		res = http.responseText;
console.log(res);
console.log(res.slice(0, 1));

		if (res.slice(0, 1) == '0')
		{	console.log(res.slice(0, 1));
			document.getElementById('test_login').innerHTML = '<font color=green> Логин свободен! </font><br>';
			let_login = true;
		}
		else
		{
			document.getElementById('test_login').innerHTML = '<font color=red> Логин занят! </font><br>';
			let_login = false;
		}
	}
}

function registrationNoLogin()
{
	console.log('http://localhost:8159/Eximer/Controller?command=register_no_login&login=nologin&password=nopass');
http.open('get', 'http://localhost:8159/Eximer/Controller?command=register_no_login&login=nologin&password=nopass');
http.onreadystatechange =  responseRegistration;
http.send(null);
}

function registration(login, pass, name, phone)
{
if (let_parol && let_login)
{	console.log('http://localhost:8159/Eximer/Controller?command=register&login='+login+'&password='+pass);
http.open('get', 'http://localhost:8159/Eximer/Controller?command=register&login='+login+'&password='+pass);
http.onreadystatechange =  responseRegistration;
http.send(null);
}
else
	if (!let_login)	console.log('Придумайте другой логин!');
	else
	if (!let_parol) console.log(parol_msg);
}

function responseRegistration(){

	if(http.readyState == 4)
	{
		resp = http.responseText;

		console.log('responseRegistration ' + resp);
		console.log('responseRegistration ' + resp);
		arrResp = resp.split("@");

		if (arrResp[0]=='0'){

			rand = arrResp[1];
			
			document.getElementById('registration').style.display = 'none';
			document.getElementById('login').style.display = 'none';
			/*document.getElementById('panel').style.display='block';
			document.getElementById('logout').style.display = 'block';*/
			
			var current_date = new Date;
		    var cookie_year = current_date.getFullYear()- -1;
		    var cookie_month = current_date.getMonth();
		    var cookie_day = current_date.getDate();

			if (arrResp[2]=="yes") { // если регистрация идет с логином и паролем - первая регистрация идет без логина, значит user_bool=false
		    	set_cookie( 'user_bool', 'true', rand, cookie_year, cookie_month, cookie_day );
		    	document.getElementById('vhod').innerHTML = '<a> '+exit+'</a>';
			}
			else
				{
				set_cookie( 'user_bool', 'false', rand, cookie_year, cookie_month, cookie_day );
				document.getElementById('vhod').innerHTML = '<a> '+reg_str+'</a>';
				}

			var cookie_year = current_date.getFullYear();
			var cookie_month = current_date.getMonth()- -1;
		    set_cookie( 'session_id', rand, cookie_year, cookie_month, cookie_day );

		    
		    //qr_shower('http://localhost:8159/Eximer/Controller?command=update_user_qr&session_id_comp='+rand);
		    qr_shower('http://localhost:8159/Eximer/Controller?command=uuq&id='+rand)
		    setTimeout('basket();',100); 
		    setTimeout(resize_menus,5000);
		    
		    //viewBooks();
		    PlaySound('sound1');//sound();
		}
	}
}

function PlaySound(soundObj) {
	  var sound = document.getElementById(soundObj);
	  sound.play();
	}

var session_id;

/* задача сделать так, чтобы польлзователь мог как регистрировать пользователя, так и пользоваться без регистрации
 * в таком случае создается sessionId и подменяются динамически, а затем связываются по телефону, то есть проходит цепочка
 * sessionId -> таблица проверки подмены -> замена на новый sessionId в запросе и добавление в ответ клиенту нового 
 * sessionId -> обработка запроса с новым sessionId -> добавление в отправку клиенту доп. указание сменить sessionId
 */
 


function start(){
	 // проверка, посещал ли ранее клиент сайт
	 if (get_cookie('session_id') && get_cookie('session_id')!='')
		{
			session_id = get_cookie('session_id');

			//document.getElementById('logout').style.display = 'block';
			console.log('start()'+get_cookie('user_bool')+'&'+(get_cookie('user_bool')=='true'));
			// проверка, ЗАЛОГИНИЛСЯ ли пользователь с паролем
			if (get_cookie('user_bool')=='true')
				{				
					document.getElementById('vhod').innerHTML = '<a> '+exit+'</a>';  //Выйти
				}
				else
				{
					document.getElementById('vhod').innerHTML = '<a> '+reg_str+'</a>'; //Войти
				}
			
			qr_shower('http://localhost:8159/Eximer/Controller?command=uuq&id='+session_id);
			
			setTimeout(basket,100); 
			setTimeout(resize_menus,5000);
			//viewBooks();
			console.log('session_id');
		}
		else
			{ // проверяет, зарегистрирован ли пользователь на сайте через логин/пароль
			let_parol = true;
			let_login = true;
			registrationNoLogin();
			document.getElementById('vhod').innerHTML = '<a> '+reg_str+'</a>';	
			}
		console.log('user_bool');
}

 
 
 var arr_akc_geo, arr_korz_geo, arr_zakl_geo;

 function qr_shower(qr_code)
 {
	 console.log('qr_shower'+qr_code);
 		var typeNumber = 4;
		var errorCorrectionLevel = 'L';
		var qr = qrcode(typeNumber, errorCorrectionLevel);
		qr.addData(qr_code);
		qr.make();
		document.getElementById('qr_shower').innerHTML = qr.createImgTag();
 		//document.getElementById('qr_shower').getElementsByTagName('IMG')[0].src=qr_code;
 		qr_shower_bool = true;
 		//document.getElementById('qr_shower').style.display = 'block';
 }
 
/*var sound_to=0;
function sound()   // запускается из-под json_ajax
{
if (sound_to!=0) clearTimeout(sound_to);

sound_to = setTimeout(sound, 6000);
viewBooks();
}

function viewBooks()
{	console.log('viewBooks'+get_cookie('session_id'));
http.open('get', 'http://localhost:8159/Eximer/Controller?command=view_books&session_id='+get_cookie('session_id'));
http.onreadystatechange = responseViewBooks;
http.send(null);

}

function responseViewBooks(){
	if(http.readyState == 4)
	{
	resp = http.responseText;

	//console.log('responseViewBooks '+resp);

	arrResp = resp.split("@");
	document.getElementById('panel2').innerHTML = arrResp[0]; console.log(document.getElementById('panel2').innerHTML);
	document.getElementById('panel3').innerHTML = arrResp[1]; console.log(document.getElementById('panel3').innerHTML);
	document.getElementById('panel2').parentNode.style.display = 'block';
	document.getElementById('panel3').parentNode.style.display = 'block';
	console.log( document.getElementById('panel2') );
	}
}

function askBook(book_id)
{	//console.log('session_id' + get_cookie('session_id'));
http.open('get', 'http://localhost:8159/Eximer/Controller?command=ask_book&session_id='+get_cookie('session_id')+'&book_id='+book_id);
http.onreadystatechange = responseAskBook;
http.send(null);
}

function responseAskBook(){
	if(http.readyState == 4)
	{
	resp = http.responseText;

	//console.log('responseAskBook '+resp);
	if (resp == 0)
		{
		console.log('Успешно запрошено!');
		viewBooks();
		}
	else console.log('Возникла ошибка!');
	}
}


function returnBook(book_id)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=return_book&session_id='+get_cookie('session_id')+'&book_id='+book_id);
http.onreadystatechange =  responseReturnBook;
http.send(null);
}

function responseReturnBook(){
	if(http.readyState == 4)
	{
	resp = http.responseText;

	//console.log('responseReturnBook '+resp);

	if (resp == 0)
		{
		console.log('Успешно зарегистрирован возврат!');
		viewBooks();
		}
	else console.log('Возникла ошибка!');
	}
}


function giveBook(user_id, book_id)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=give_book&session_id='+get_cookie('session_id')+'&book_id='+book_id+'&user_id='+user_id);
http.onreadystatechange =  responseGiveBook;
http.send(null);
}

function responseGiveBook(){
	if(http.readyState == 4)
	{
	resp = http.responseText;

	//console.log('responseGiveBook '+resp);

	if (resp == 0)
		{
		console.log('Успешно выдано!');
		viewBooks();
		}
	else console.log('Возникла ошибка!');
	}
}


function takeBook(book_id)
{
http.open('get', 'http://localhost:8159/Eximer/Controller?command=take_book&session_id='+get_cookie('session_id')+'&book_id='+book_id);
http.onreadystatechange =  responseTakeBook;
http.send(null);
}

function responseTakeBook(){
	if(http.readyState == 4)
	{
	resp = http.responseText;
console.log(resp);
	if (resp == 0)
		{
		console.log('Успешно принято!');
		viewBooks();
		}
	else console.log('Возникла ошибка!');
	}
}


function usr_show()
{		//console.log('usr_show');
for (var i = 0; i < document.getElementsByClassName('usr').length; i++)
{
document.getElementsByClassName('usr')[i].style.display = 'block';
document.getElementsByClassName('admin')[i].style.display = 'none';
}
}

function admin_show()
{	//console.log('admin_show');
for (var i = 0; i < document.getElementsByClassName('usr').length; i++)
{
document.getElementsByClassName('usr')[i].style.display = 'none';
document.getElementsByClassName('admin')[i].style.display = 'block';
}
}
*/
</script>  