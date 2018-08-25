<%@ page contentType="text/html;charset=utf-8" language="java" %>
<script type="text/javascript">

/**
 * 
 */

var lin_zn = [];
		var lin_res = [];
		var lin_op = [];
		var lin_diap = [];
		var lin_koeff = [];
		var lin_ist = [];
		var znach = [];
		var dif_diap = [];
		var operator = [];
		var dif_koeff = [];
		var dif_ist = [];
		var num_col = [];
		var col_len = [];
		var c_xy = 0;
		var pre_num = [];
		var test = [];

var col_str = [];
col_str[0] = [];

function one_page_show()
{
alert(123);



k_e = new Object(); k_e.keyCode = 40; keyd(k_e); krut_active = false;
}

function one_page(){

			col_str[0][0] = [];

			col_str[0][0][0] = ['#0_0', 'v0_0'];
			div = document.createElement('DIV');
			div.innerHTML = '<h1>Admin Panel</h1>';
			div.id = '#0_0';
			div = document.createElement('DIV');
			div.id = 'v0_0';

			draw_3d();

//console.log(document.getElementById('v0_0'));
    			document.getElementById('v0_0').appendChild(document.getElementById('one_page'));
}


function res_count()
{

	for (var i = 0; i < page_print.length; i++)
	{
		col_str[0][i] = [];
		for (var j = 0; j < page_print[i].length; j++)
		if (typeof page_print[i][j]=='string')
		{      console.log(page_print[i][j]);
			col_str[0][i][j] = ['#'+i+'_'+j, 'v'+i+'_'+j];
			div = document.createElement('DIV');
			div.innerHTML = '<h1>'+page_print[i][j]+'</h1>';
			div.id = '#'+i+'_'+j;
			div = document.createElement('DIV');
			div.id = 'v'+i+'_'+j;
		}
	}
	console.log('1274 col_str');
       console.log(col_str);
	for (c_xy = 0; c_xy < pge_xy.length; c_xy++)
	{
		i_xy = pge_xy[arr_cep[i_max][c_xy]][0];
		j_xy = pge_xy[arr_cep[i_max][c_xy]][1];

		base[base.length] = 'pg'+arr_cep[i_max][c_xy];

		lin_zn[c_xy] = [];
		lin_res[c_xy] = [];
		lin_op[c_xy] = [];
		lin_diap[c_xy] = [];
		lin_koeff[c_xy] = [];
		lin_ist[c_xy] = [];
		znach[c_xy] = znach_print[i_xy][j_xy].slice();
		dif_diap[c_xy] = dif_diap_print[i_xy][j_xy].slice();
		operator[c_xy] = operator_print[i_xy][j_xy].slice();
		dif_koeff[c_xy] = dif_koeff_print[i_xy][j_xy].slice();
		dif_ist[c_xy] = dif_ist_print[i_xy][j_xy].slice();

console.log(znach_print[i_xy][j_xy].slice());
console.log('1054 '+znach[c_xy]);
		sign_lin(znach[c_xy], znach_print[i_xy][j_xy].slice(), dif_diap[c_xy], dif_koeff[c_xy], dif_ist[c_xy]);
console.log('1056 '+znach[c_xy]);
		//diap_lin(dif_diap[c_xy], dif_diap_print[i_xy][j_xy].slice());
		oper_lin(operator[c_xy], operator_print[i_xy][j_xy].slice());
        pre_num[c_xy] = lin_res[c_xy].length;
		num_col[c_xy] = arr_val.length;
		col_len[c_xy] = arr_val[0].length;
		arr_val[ num_col[c_xy] ] = [];

		console.log('lin_res['+c_xy+']'+lin_res[c_xy]);
		console.log('start');

		console.log(lich(operator[c_xy], znach[c_xy], dif_koeff[c_xy], dif_diap[c_xy]));

		console.log('end');
		console.log('lin_res['+c_xy+'] '+lin_res[c_xy]);
		console.log('lin_zn['+c_xy+'] '+lin_zn[c_xy]);
		console.log('lin_op['+c_xy+'] '+lin_op[c_xy]);
		console.log('lin_diap['+c_xy+'] '+lin_diap[c_xy]);
		console.log('lin_koeff['+c_xy+'] ');
		console.log(lin_koeff[c_xy]);
		console.log('lin_ist['+c_xy+'] ');
		console.log(lin_ist[c_xy]);

    }





test = [];

num_el_test = 8; //lin_koeff.length;//
arr_0_len = [];

	for (c_xy = 0; c_xy < pge_xy.length; c_xy++)
	{
		arr_0_len[c_xy] = lin_koeff[c_xy].length;//raw_data[0].length;
	    test[c_xy] = [];
		for (var init = 0; init < num_el_test; init++)
		{
			test[c_xy][init] = [];
			for (var i = 0; i < arr_0_len[c_xy]; i++)
			{

				test[c_xy][init][i] = Math.random()*2;
			}
			console.log('test['+c_xy+']['+init+'] '+test[c_xy][init]);
		}
	}
	var step;
	min = 10000000000;
	min_a = -1;
	min_arr = [];
	min_step = -1;



	for (var step = 0; step < num_el_test- -1; step++)
	{
		console.log('step'+step);
		console.log(test);
		for (c_xy = 0; c_xy < pge_xy.length; c_xy++)
		{


	       	for (var init = 0; init < num_el_test /8; init++)
	       	{
		       	var rand = Math.floor(Math.random()* arr_0_len[c_xy]);
		       	var t1 = [];
		       	var t2 = [];
	       		 for (var i = 0;  i < rand; i++)
	       		 {
	       		 	t1[i] = test[c_xy][init][i]; console.log('test['+c_xy+']['+(init- -num_el_test/8)+']['+i+']');
	       		 	t2[i] = test[c_xy][init- -num_el_test/8][i];
	       	   	 }

	       	      for (;  i < arr_0_len[c_xy]; i++)
	       		 {
	       		 	t1[i] = test[c_xy][init- -num_el_test/8][i]; console.log('test['+c_xy+']['+init+']['+i+']');
	       		 	t2[i] = test[c_xy][init][i];
	       	   	 }


		       	test[c_xy][init- -num_el_test/4  ] = t1;
		       	test[c_xy][init- -num_el_test/8*3] = t2;


	       	}

	       	for (var init = num_el_test /2; init < num_el_test; init++)
			{

				for (var i = 0; i < arr_0_len[c_xy]; i++)
					test[c_xy][init][i] = Math.random()*2;
				console.log('test['+c_xy+']['+init+'] '+test[c_xy][init]);
			}
		}
       	var sum_el = [];

       	for (var init = 0; init < num_el_test; init++)
       	{
       		var res = val(init);
            console.log('step '+step+' init '+init+' res '+res);
       		sum_el[init] = res;
       		if (min > res)
       		{
       			min = res;
       			min_a = init;
       			//min_arr = test[init].slice();
       			min_step = step;
       		}
       	}

       	var sort_a = [0];
       	var sort = [sum_el[0]];
       	console.log(sum_el);
       	console.log('num_el_test'+num_el_test);
       	for (var i = 1; i < num_el_test; i++)
       	{
       		for (var j = 0; j < i; j++)
       		{
       			if (sum_el[i] >= sort[j])
       			{
       				sort.splice(j,0,sum_el[i]);
       				sort_a.splice(j,0,i);
       				break;
       			}
       		}
       		if (i==j)
       		{
       			sort.splice(j,0,sum_el[i]);
       			sort_a.splice(j,0,i);
       		}
       	}


       	console.log(sort);
        console.log('sort_a'+sort_a);
       	var new_test = [];
       	for (c_xy = 0; c_xy < pge_xy.length; c_xy++)
       	{
       		new_test[c_xy] = [];

	       	for (var i = 0; i < num_el_test; i++)
	       	{
		       	new_test[c_xy][new_test[c_xy].length] = test[c_xy][ sort_a[i] ].slice();
	       	}
        }
       	test = new_test;

    }

    draw_3d();
    for (c_xy = 0; c_xy < pge_xy.length; c_xy++)
			{

		       table = document.createElement('TABLE');
		         for (var j = 0; j < col_len[c_xy]; j++)
		         {
		         tr = document.createElement('TR');
		         td = document.createElement('TD');
		         tr.appendChild(td); console.log(test); console.log('min_a '+min_a+' c_xy '+c_xy);
		         td.innerHTML = arr_val[ num_col[c_xy] ][j] * test[ c_xy ][ min_a ];

	             table.appendChild(tr);
		         }
	         	i_xy = pge_xy[arr_cep[i_max][c_xy]][0];
				j_xy = pge_xy[arr_cep[i_max][c_xy]][1];
				console.log(document.getElementById('v'+i_xy+'_'+j_xy));
	       		document.getElementById('v'+i_xy+'_'+j_xy).appendChild(table);
	       }
}


var arr_s_col = [];

var arr_slu = [];

var arr_w = [];


//*nabiraem massiv ctranichnogo vida, nashi rubriki budut v kolonkah, perehod po gorizontali rovnij

styles_types = ['five_','three_','one_','six_','two_'];
containers = ['v1_1','v1_2','v1_3','v1_4','v1_5','v1_6','v4_1','v4_2','v6_1','v6_2'];
crkl_displ = ['none','block','block','block','block','block','block','block','block','block'];
	// right  	// left		//  down	// up			// front
orien = [
	[['#5', 'v5'	    ],['#3', 'v3'	],    ['#1', 'v1'       ],['#6', 'v6'       ],['#2', 'v2'       ]]
	];

arr_str = [['sto','str',]];// geta - uzaemnasvyazaniya kubi
arr_stl = [['sto','str',]];

settingi = ['setting123'];

var myWidth = 0, myHeight = 0;

if( typeof( window.innerWidth ) == 'number' )
{
    //Non-IE
 myWidth = window.innerWidth;
  myHeight = window.innerHeight;
}
else
if( document.documentElement && ( document.documentElement.clientWidth ||
document.documentElement.clientHeight ) )
{
    //IE 6+ in 'standards compliant mode'
 myWidth = document.documentElement.clientWidth;
   myHeight = document.documentElement.clientHeight;
}
              var myWidth1600 = myWidth/1600;

str = "<style> "+
" #cube_str .one_str  { -webkit-transform: rotateX(90deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px);  }"+
" #cube_str .two_str  { -webkit-transform: translateZ("+ (Math.floor(myWidth*0.4))+ "px);}"+
" #cube_str .three_str { -webkit-transform: rotateY(90deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+
" #cube_str .four_str { -webkit-transform: rotateY(180deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+
" #cube_str .five_str { -webkit-transform: rotateY(-90deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+
" #cube_str  .six_str { -webkit-transform: rotateX(-90deg)   translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+

" #cube_sto  .one_sto  { -webkit-transform: rotateX(90deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px);  }"+
" #cube_sto  .two_sto  { -webkit-transform: translateZ("+ (Math.floor(myWidth*0.4))+ "px);}"+
" #cube_sto  .three_sto { -webkit-transform: rotateY(90deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+
" #cube_sto  .four_sto { -webkit-transform: rotateY(180deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+
" #cube_sto  .five_sto { -webkit-transform: rotateY(-90deg) translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+
" #cube_sto  .six_sto { -webkit-transform: rotateX(-90deg)   translateZ("+ (Math.floor(myWidth*0.4))+ "px); }"+

" .one_small  { -webkit-transform: rotateX(90deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px);  }"+
" .two_small  { -webkit-transform: translateZ("+ (Math.floor(myWidth*0.3))+ "px);}"+
" .three_small { -webkit-transform: rotateY(90deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
" .four_small { -webkit-transform: rotateY(180deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
" .five_small { -webkit-transform: rotateY(-90deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
" .six_small { -webkit-transform: rotateX(-90deg)   translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+

" .one_sto_small  { -webkit-transform: rotateX(90deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px);  }"+
" .two_sto_small  { -webkit-transform: translateZ("+ (Math.floor(myWidth*0.3))+ "px);}"+
" .three_sto_small { -webkit-transform: rotateY(90deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
" .four_sto_small { -webkit-transform: rotateY(180deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
" .five_sto_small { -webkit-transform: rotateY(-90deg) translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
" .six_sto_small { -webkit-transform: rotateX(-90deg)   translateZ("+ (Math.floor(myWidth*0.3))+ "px); }"+
"</style>";

document.write(str);
	

 var setting = document.getElementById('setting123');

function draw_3d()
{

 console.log('1773 col_str');
	console.log(col_str);

 function getOffset(elem) {
    if (elem.getBoundingClientRect) {
        // "Ð ÑÐ¡ÐÐ Â°Ð ÐÐ ÑÐ Â»Ð¡ÐÐ ÐÐ¡â¹Ð â" Ð ÐÐ Â°Ð¡ÐÐ ÑÐ Â°Ð ÐÐ¡â
        return getOffsetRect(elem)
    } else {
        // Ð ÑÐ¡ÑÐ¡ÐÐ¡âÐ¡Ð Ð¡ÐÐ Â°Ð Â±Ð ÑÐ¡âÐ Â°Ð ÂµÐ¡â Ð¡â¦Ð ÑÐ¡âÐ¡Ð Ð ÑÐ Â°Ð Ñ-Ð¡âÐ Ñ
        return getOffsetSum(elem)
    }
}

function getOffsetSum(elem) {
    var top=0, left=0;
    while(elem) {
        top = top + parseInt(elem.offsetTop);
        left = left + parseInt(elem.offsetLeft);
        elem = elem.offsetParent;
    }

    return [ top, left];
}

function getOffsetRect(elem) {
    var box = elem.getBoundingClientRect();
    var body = document.body;
    var docElem = document.documentElement;
    var scrollTop = window.pageYOffset || docElem.scrollTop || body.scrollTop;
    var scrollLeft = window.pageXOffset || docElem.scrollLeft || body.scrollLeft;
    var clientTop = docElem.clientTop || body.clientTop || 0;
    var clientLeft = docElem.clientLeft || body.clientLeft || 0;
    var top  = box.top +  scrollTop - clientTop;
    var left = box.left + scrollLeft - clientLeft;
    return [ Math.round(top), Math.round(left)];
}



var svg_lichba = function (num)
{
enumi = num;

var lev;
	if (num < 0.01 && num != 0)
	{
	for (jj = 0.01, lev = 2; jj > num && lev < 20; lev++)
	        jj /= 10;
	}
	else if(num < 0.1)
	{
	lev = 2;
	}
	else
	lev = 1;

	//num = (num).toFixed(lev);
	var str = '.', i, j, str_1;
	var xvost = (num % 1).toFixed(lev);
	str += (xvost).toString().slice(2);

//console.log('1   num=' +num + '     str='+str +'      xvost=' +xvost);

	num = (num-xvost).toFixed(lev);

//console.log('2   num=' +num + '     str='+str +'      xvost=' +xvost);



	xvost = 0;



	for ( i = 1000, j = 0;  ;i *=1000, j++)
	{
		xvost = num % i - xvost;
		num -= xvost;
		str_1 = (xvost).toString().slice(0, (xvost).toString().length-j*3);
		xvost = 0;
		if (num >= i) {
			if ( str_1 == '0')  str_1 += '00';
			str = ' ' + str_1 + str;
		}
		else
		{
			str = ' ' + str_1 + str;
			break;// tamy-shta treba xozj adzin raz zapuscicj
		}
	}
	str_1 = '';
	for (i = 0; i < 12-str.length; i++)
	str_1 += ' ';


//console.log(enumi +'   lev =' +lev + '   num=' +num + '     str='+str);


	return str_1 + str;
}




var svg_text = function (text, width)
{
var arr = text.split(' ');
var res = '<tspan x="35" dy="1.5em">';
var el = document.createElement('a');
document.lastChild.appendChild(el);
for (var i = 0; i < arr.length; i++)
{
el.innerHTML += arr[i] + ' ';
if (el.offsetWidth < width)
res += arr[i]  + ' ';
else
{
res +=  '</tspan><tspan x="35" dy="1.5em">'+ arr[i]  + ' ';
el.innerHTML = '';
}
}
res += '</tspan>';
document.lastChild.removeChild( document.lastChild.lastChild);

return res;
}

           //  Ð âºÐ ÂÐ ÑÐ ÂÐ Â
		  // Ð Ð Ð¡ÐÐ¡âÐ¡ÐÐ ÑÐ ÑÐ Âµ Ð ÑÐ Â°Ð¡ÐÐ¡ÐÐ ÑÐ ÐÐ Â°- Ð Â»Ð ÑÐ ÐÐ ÑÐ¡Ð-Ð ÑÐ Â°Ð¡âÐ ÂµÐ ÑÐ ÑÐ¡ÐÐ ÑÐ¡Ð, Ð Â° Ð Ð Ð ÑÐ ÑÐ Â»Ð ÑÐ ÐÐ ÑÐ Â°Ð¡â¦ - Ð ÑÐ ÒÐ ÐÐ Â° Ð¡âÐ ÑÐ¡â¡Ð ÑÐ Â°

colors = ['#214cce','#90a5e6','#bcc9f0','#4cce21','#6fd74d','#a5e690','green','yellow','orange', 'red', '#214cce',
'gold', 'crimson','chartreuse','Indigo','Maroon', 'MidnightBlue','Navy','RoyalBlue','SteelBlue' ];

var stacked_col = [];
var arr_col = [];
var prev_el_col =[];
var box_col = [];
var rect_col = [];
var svg_col =[];
var desc_col = [];
var prev_x_col = [];
var prev_y_col = [];
var prev_el_col = [];
var sc_col = [];
var mult_col = [];
var mera_col = [];
var cur_obb_col = 0;
var legend_col = [];
var name_col = [];
var name_c = [];
var x_period = [];

var arrx = [];
var new_sort = [];
var nom_sort = [];
var mid_arrx = [];
var mid_sort = [];
var i_col_old = 0;
var j_col_old = 0;
var n_tras_col = 0;

var prev_rect_c4 = '';

function arr_s_col_start()
{


for (var i = 0; i < orien.length; i++)
for (var j = 0; j < orien[i][4].length; j++)
document.getElementById(orien[i][4][j]).innerHTML = document.getElementById(col_str[i][0][0][j]).innerHTML;

for (var i = 0; i < col_str.length; i++)
for (var ie = 0; ie < arr_str[i].length; ie++)
for (var j = 0; j < col_str[i].length; j++)
for (var c = 0; c < col_str[i][j].length; c++)
{
//console.log("div"+col_str[i][j][c][ie]);
document.getElementById(col_str[i][j][c][ie]).innerHTML += document.getElementById("div"+col_str[i][j][c][ie]).innerHTML;
}


for (var i = 0; i < col_str.length; i++)
//for (var ie = 0; ie < arr_str[i].length; ie++)
{
			menu_show = document.createElement('div');
			menu_show.pos = 1;

svg = document.createElementNS("http://www.w3.org/2000/svg", 'svg');
svg.setAttribute('width', 520*myWidth1600);
svg.setAttribute('height', 720*myWidth1600);
svg.setAttribute('style', 'position:absolute;top:'+320*myWidth1600+'px;left:0px;');
svg.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
svg.setAttribute('version', '1.1');

menu = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
menu.setAttribute('id', 'menu_'+arr_str[i][0]);
menu.setAttribute('x', 10);
menu.setAttribute('y', 10);
menu.setAttribute('rx', 20);
menu.setAttribute('ry', 20);
menu.setAttribute('width', 500*myWidth1600);
menu.setAttribute('height', 700*myWidth1600);
menu.setAttribute('style', 'fill:red;stroke:black;stroke-width:5;opacity:0.9;z-index:-1;');   //
svg.appendChild(menu);



	   		menu = document.createElement('div');
			menu.setAttribute('style', 'position:absolute;top:'+320*myWidth1600+'px;left:30px;width:'+450*myWidth1600);

			menu_show.appendChild(svg);  // menu
			menu_show.onmousedown = function (){ if (this.pos==0) {this.pos = 1; this.childNodes[0].style.display='block';
										this.childNodes[1].style.display='block';
										this.childNodes[2].style.display='none';
										this.childNodes[3].style.display='none'; } else
 {this.pos = 0; this.childNodes[0].style.display='none';this.childNodes[1].style.display='none';this.childNodes[2].style.display='block';this.childNodes[3].style.display='block'; } }


			document.getElementById(settingi[i]).appendChild(menu_show);



	for (var j = 0; j < col_str[i].length; j++)
	{
		var ul = document.createElement('ul');

		for (var c = 0; c < col_str[i][j].length; c++)
		{





			var li = document.createElement('li');
	   		li.innerHTML = document.getElementById(col_str[i][j][c][0]).innerText;
	   		li.setAttribute('style', ' ');
	   		li.setAttribute('class', 'li');
			li.X = j;
			li.Y = c;
			li.krut_active_node = i;
			li.addEventListener('mousedown',function ()
{
krut_active_node = this.krut_active_node;

for (; this.X < X[krut_active_node]-1; )
X[krut_active_node]--;

for (; this.X > X[krut_active_node]-(-1); )
X[krut_active_node]++;


for (; this.Y < Y[krut_active_node]-1; )
Y[krut_active_node]--;

for (; this.Y > Y[krut_active_node]-(-1); )
Y[krut_active_node]++;


if (this.X < X[krut_active_node]) { k_e.keyCode = 37; keyd(k_e); krut_active = false;}
else
if (this.X > X[krut_active_node]) { k_e.keyCode = 39; keyd(k_e); krut_active = false;}
else
if (this.Y < Y[krut_active_node]) { k_e.keyCode = 38; keyd(k_e); krut_active = false;}
else
if (this.Y > Y[krut_active_node]) { k_e.keyCode = 40; keyd(k_e); krut_active = false;}
}, false);

	   		ul.appendChild(li);
		}
		menu.appendChild(ul);

		hr = document.createElement('hr');
		menu.appendChild(hr);


	}

			menu_show.appendChild(menu);

svg_nazva = document.createElementNS("http://www.w3.org/2000/svg", 'svg');
svg_nazva.setAttribute('width', 120*myWidth1600);
svg_nazva.setAttribute('height', 100*myWidth1600);
svg_nazva.setAttribute('style', 'position:absolute;top:'+320*myWidth1600+'px;left:0px;');
svg_nazva.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
svg_nazva.setAttribute('version', '1.1');

menu_nazva = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
menu_nazva.setAttribute('x', 10);
menu_nazva.setAttribute('y', 10);
menu_nazva.setAttribute('rx', 20);
menu_nazva.setAttribute('ry', 20);
menu_nazva.setAttribute('width', 100*myWidth1600);
menu_nazva.setAttribute('height', 80*myWidth1600);
menu_nazva.setAttribute('style', 'fill:red;stroke:black;stroke-width:5;opacity:0.9;z-index:-1;');   //
svg_nazva.appendChild(menu_nazva);

svg_nazva.style.display='none';

menu_show.appendChild(svg_nazva);

			menu_text = document.createElement('div');
			menu_text.innerHTML = 'ÐÐÐÐ®';
			menu_text.setAttribute('style', 'position:absolute;top:'+360*myWidth1600+'px;left:20px;');
			menu_text.style.display='none';
			menu_show.appendChild(menu_text);
}



for (var i = 0; i < arr_str.length; i++)
{
for (j = 0; j < arr_str[i].length; j++)
{
document.getElementById("experiment_" + arr_str[i][j]).krut_active_node = i;
document.getElementById("experiment_" + arr_str[i][j]).addEventListener("mousedown",
	     function () {  krut_active_node = this.krut_active_node;  event.cancelBubble=true; }
	     , false);
}
}

for (var i = 0; i < containers.length; i++)
{
	var div = document.createElement('div');
	div.setAttribute('id', 'svg_place'+i);
	document.getElementById(containers[i]).appendChild(div);
}



for ( obb_col = 0; obb_col < arr_s_col.length; obb_col++)
{
place = document.getElementById('svg_place'+obb_col);

svg = document.createElementNS("http://www.w3.org/2000/svg", 'svg');
svg.setAttribute('width', 650*myWidth1600);
svg.setAttribute('height', 700*myWidth1600);
svg.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
svg.setAttribute('version', '1.1');
place.appendChild(svg);

rect = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
rect.setAttribute('id', 'rect_col'+obb_col);
rect.setAttribute('width', 600*myWidth1600);
rect.setAttribute('height', 500*myWidth1600);
rect.setAttribute('stroke-width', 1);
rect.setAttribute('stroke', 'black');
rect.setAttribute('fill', 'white');
rect.setAttribute('y', 75*myWidth1600);
svg.appendChild(rect);

g = document.createElementNS("http://www.w3.org/2000/svg", 'g');
g.setAttribute('id', 'svg_col'+obb_col);
svg.appendChild(g);

rect = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
rect.setAttribute('id', 'box_col'+obb_col);
rect.setAttribute('x', 50);
rect.setAttribute('y', 200);
rect.setAttribute('rx', 20);
rect.setAttribute('ry', 20);
rect.setAttribute('width', 210*myWidth1600);
rect.setAttribute('height', 100*myWidth1600);
rect.setAttribute('style', 'fill:red;stroke:black;stroke-width:5;opacity:0.5;z-index:-1;display:none;');
svg.appendChild(rect);

text = document.createElementNS("http://www.w3.org/2000/svg", 'text');
text.setAttribute('id', 'desc_col'+obb_col);
text.setAttribute('x', 50);
text.setAttribute('y', 200);
text.setAttribute('style', 'display:block;width:100px;font-size:10pt;');
svg.appendChild(text);

///////////////////////
svg = document.createElementNS("http://www.w3.org/2000/svg", 'svg');
svg.setAttribute('width', 600*myWidth1600);
svg.setAttribute('height', 700*myWidth1600);
svg.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
svg.setAttribute('version', '1.1');
place.appendChild(svg);

rect = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
rect.setAttribute('id', 'rect_slu'+obb_col);
rect.setAttribute('width', 600*myWidth1600);
rect.setAttribute('height', 500*myWidth1600);
rect.setAttribute('stroke-width', 1);
rect.setAttribute('stroke', 'black');
rect.setAttribute('fill', 'white');
rect.setAttribute('y', 75*myWidth1600);
svg.appendChild(rect);

g = document.createElementNS("http://www.w3.org/2000/svg", 'g');
g.setAttribute('id', 'svg_slu'+obb_col);
svg.appendChild(g);

rect = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
rect.setAttribute('id', 'box_slu'+obb_col);
rect.setAttribute('x', 50);
rect.setAttribute('y', 200);
rect.setAttribute('rx', 20);
rect.setAttribute('ry', 20);
rect.setAttribute('width', 210*myWidth1600);
rect.setAttribute('height', 100*myWidth1600);
rect.setAttribute('style', 'fill:red;stroke:black;stroke-width:5;opacity:0.5;z-index:-1;display:none;');
svg.appendChild(rect);

text = document.createElementNS("http://www.w3.org/2000/svg", 'text');
text.setAttribute('id', 'desc_slu'+obb_col);
text.setAttribute('x', 50);
text.setAttribute('y', 200);
text.setAttribute('style', 'display:block;width:100px;font-size:10pt;');
svg.appendChild(text);

hr = document.createElement('hr');
hr.setAttribute('size','3px');
hr.setAttribute('color','green');
place.appendChild(hr);


svg = document.createElementNS("http://www.w3.org/2000/svg", 'svg');
svg.setAttribute('width', 700*myWidth1600);
svg.setAttribute('height', 700*myWidth1600);
svg.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
svg.setAttribute('version', '1.1');
place.appendChild(svg);

g = document.createElementNS("http://www.w3.org/2000/svg", 'g');
g.setAttribute('id', 'svg'+obb_col);
svg.appendChild(g);

rect = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
rect.setAttribute('id', 'box_'+obb_col);
rect.setAttribute('x', 50);
rect.setAttribute('y', 200);
rect.setAttribute('rx', 20);
rect.setAttribute('ry', 20);
rect.setAttribute('width', 210*myWidth1600);
rect.setAttribute('height', 100*myWidth1600);
rect.setAttribute('style', 'fill:red;stroke:black;stroke-width:5;opacity:0.5;z-index:-1;display:none;');
svg.appendChild(rect);

text = document.createElementNS("http://www.w3.org/2000/svg", 'text');
text.setAttribute('id', 'desc_'+obb_col);
text.setAttribute('x', 50);
text.setAttribute('y', 200);
text.setAttribute('style', 'display:block;width:100px;font-size:10pt;');
svg.appendChild(text);


  	stacked_col[obb_col] = false;
  	arr_col[obb_col] = [];
	x_period[obb_col] = 1;

svg_col[obb_col] = document.getElementById('svg_col' + obb_col);
rect_col[obb_col] = document.getElementById('rect_col' + obb_col);

rect_col[obb_col].addEventListener("mousedown", function (e){
			cur_obb_col = this.obb_col;
			if (stacked_col[this.obb_col])
			{
			stacked_col[this.obb_col] = false;
			name_c[this.obb_col] = name_col[this.obb_col][0].slice();
			draw_col( arr_s_col[this.obb_col].slice(), "single");
			unhide_col("svg_col" + this.obb_col);
			}
			else
			{
						var x = e.pageX;
				  		var y = e.pageY;

					    if (x < mid_arrx[cur_obb_col][0]) return;

						for (i = 0; i < mid_arrx[cur_obb_col].length -1; i++)
						if (x > mid_arrx[cur_obb_col][i] && x < mid_arrx[cur_obb_col][i- -1])
						break;

						if (i == mid_arrx[cur_obb_col].length -1) return;

						if (y < mid_sort[cur_obb_col][i][0]) return;

						for (j = 0; j < mid_sort[cur_obb_col][i].length -1; j++)
							if (y > mid_sort[cur_obb_col][i][j] && y < mid_sort[cur_obb_col][i][j- -1])
							break;

						if (j == mid_sort[cur_obb_col][i].length -1) return;

						j = nom_sort[cur_obb_col][i][j];

				   	if (!stacked_col[cur_obb_col]) 	{
								   					stacked_col[cur_obb_col] = true;
								   					hide_col("svg_col"+cur_obb_col);
													name_c[cur_obb_col] = name_c[cur_obb_col][ j ][1];
													arr_col[cur_obb_col] = arr_s_col[cur_obb_col][ j ].slice();
													}

			}
															}, false);
rect_col[obb_col].obb_col = obb_col;
desc_col[obb_col] = document.getElementById('desc_col' + obb_col);

box_col[obb_col] = document.getElementById('box_col' + obb_col);

legend_col[obb_col] = arr_s_col[obb_col].splice(0,1)[0];
name_col[obb_col] = arr_s_col[obb_col].splice(0,1)[0];


name_c[obb_col] = name_col[obb_col][0].slice();

sc_col[obb_col] = legend_col[obb_col][1];		//arr_s_col[obb_col][0]
mult_col[obb_col] = legend_col[obb_col][2];		//arr_s_col[obb_col][0]
mera_col[obb_col] = legend_col[obb_col][3];

svg_col[obb_col].ooo = [];
prev_x_col[obb_col] = -1;
prev_y_col[obb_col] = -1;
prev_el_col[obb_col] = [];


arrx[obb_col] = [];
new_sort[obb_col] = [];
nom_sort[obb_col] = [];
mid_arrx[obb_col] = [];
mid_sort[obb_col] = [];
}

draw_slu();
draw_w();


k_e = new Object();
k_e.keyCode = 37; keyd(k_e); krut_active = false;

/*
for (var i = 0; i < arr_str.length; i++)
{
krut_active_node = i;
keyd(k_e); krut_active = false;
}*/
}

function draw_col(arr_m_col, tip)
{
	while( svg_col[cur_obb_col].hasChildNodes() )
		svg_col[cur_obb_col].removeChild(svg_col[cur_obb_col].lastChild);

			var rect_c4 = document.createElementNS("http://www.w3.org/2000/svg", 'path');
			    rect_c4.setAttribute('style', 'display:none');
				rect_c4.setAttribute('d','M0,0 l0,-5 a5,5 0 1,1 0.0001,0 z');
				svg_col[cur_obb_col].appendChild(rect_c4);
                prev_rect_c4 = rect_c4;

pos_arr = getOffset(svg_col[cur_obb_col]);
svg_col[cur_obb_col].posX = pos_arr[1];
svg_col[cur_obb_col].posY = pos_arr[0];


	var max_col = -100000000000;
	var min_col =  100000000000;

	if (stacked_col[cur_obb_col] )
	{
		//i_start_col = 0;
		arr_col[cur_obb_col] = [];
		for (var i = 0; i < arr_m_col.length; i++)
			{
				arr_zam_col = [];
				if (tip == 'sum')
				{
				for (var j = 0; j <= i; j++)  // for sum
					for (c = 0; c < arr_m_col[j].length; c++)// for sum
						if (j == 0)  arr_zam_col[c] = arr_m_col[j][c];// for sum
						else
						{
							arr_zam_col[c] -= -arr_m_col[j][c];// for sum
							if (arr_zam_col[c] > max_col) max_col = arr_zam_col[c];// for sum
							if (arr_zam_col[c] < min_col) min_col = arr_zam_col[c];// for sum
						}
				}
				else
				if (tip == 'single')
				{
					for (c = 0; c < arr_m_col[i].length; c++)
					{
						arr_zam_col[c] = arr_m_col[i][c];
						if (arr_zam_col[c] > max_col) max_col = arr_zam_col[c];// for single
						if (arr_zam_col[c] < min_col) min_col = arr_zam_col[c];// for single
					}
				}
			arr_col[cur_obb_col][i] = arr_zam_col;
			}
	}
	else
	{
		arr_col[cur_obb_col] = [];
		for (var i = 0; i < arr_m_col.length; i++)
		{
			arr_zam_col = [];
			for (var j = 0; j < arr_m_col[i].length; j++)
				for (c = 0; c < arr_m_col[i][j].length; c++)
					{
					if (j == 0)  arr_zam_col[c] = arr_m_col[i][j][c];
					else  arr_zam_col[c] -= -arr_m_col[i][j][c];

					if (arr_zam_col[c] > max_col) max_col = arr_zam_col[c];
					if (arr_zam_col[c] < min_col) min_col = arr_zam_col[c];
					}
			arr_col[cur_obb_col][i] = arr_zam_col;
		}
	}

min_col = min_col - ((max_col - min_col)/mult_col[cur_obb_col] -(-min_col))/10;

var mid_sc = (max_col - min_col)/mult_col[cur_obb_col] -(-min_col);  // sc_col[cur_obb_col] agulna zamenena na mid_sc

if  (!sc_col[obb_col] )
min_mid_sc = mid_sc;
else
min_mid_sc = sc_col[obb_col];

 var delta_verh = 400*myWidth1600/( (max_col-mid_sc)/mult_col[cur_obb_col] - (min_col-mid_sc));

 var delta_niz = 400*myWidth1600/( (max_col-min_mid_sc)/mult_col[cur_obb_col] - (min_col-min_mid_sc));

		var net_col = document.createElementNS("http://www.w3.org/2000/svg", 'path');  // liniya mashtaby
	 	net_col.setAttribute('stroke', 'green');
	 	net_col.setAttribute('stroke-width','1');
	 	net_col.setAttribute('d','M 10,'+(500*myWidth1600-(mid_sc - min_col)*delta_verh)+' l '+(570*myWidth1600)+',0');
	 	svg_col[cur_obb_col].appendChild(net_col);

var delq_verh = Math.floor(   (max_col-mid_sc)/mult_col[cur_obb_col] / ( (max_col-mid_sc)/mult_col[cur_obb_col] - (min_col-mid_sc))*20 );//-(-0.001);
var delq_niz = Math.floor(   (min_mid_sc-min_col) / ( (max_col-min_mid_sc)/mult_col[cur_obb_col] - (min_col-min_mid_sc))*20 );//-(-0.001);

uuu_niz = 1;
for (eje_niz = 0.0000000001; eje_niz*uuu_niz*delq_niz < min_mid_sc; )
{
eje_niz *= 10;
for (uuu_niz = 1; uuu_niz < 10 && eje_niz*uuu_niz*delq_niz < min_mid_sc; )
	uuu_niz++;
}

uuu_verh = 1;
for (eje_verh = 0.0000000001; eje_verh*uuu_verh*delq_verh < max_col; )
{
eje_verh *= 10;
for (uuu_verh = 1; uuu_verh < 10 && eje_verh*uuu_verh*delq_verh < max_col; )
	uuu_verh++;
}

mas_niz = eje_niz*uuu_niz;
mas_verh =eje_verh*uuu_verh;

	for (var i = 0; i <= Math.floor( max_col/mas_verh )-(-1); i++)
	{
		if (mas_verh *i > mid_sc)
		{
			res_y = (mid_sc-min_col   -(mid_sc -mas_verh *i)/mult_col[cur_obb_col])*delta_verh;

			var text_col = document.createElementNS("http://www.w3.org/2000/svg", 'text');
	 		text_col.setAttribute('style',"font-family:Arial;font-size:10pt;font-color:white;");
	 		text_col.setAttribute('fill', 'black');
	 		text_col.setAttribute('x', 5);
	 		text_col.setAttribute('y', (505*myWidth1600 -res_y));
			text_col.innerHTML = svg_lichba(mas_verh *i);
	 		svg_col[cur_obb_col].appendChild(text_col);
			text_col.setAttribute('x', 75*myWidth1600-text_col.clientWidth);

	 		var net_col = document.createElementNS("http://www.w3.org/2000/svg", 'path');
	 		net_col.setAttribute('stroke', 'black');
	 		net_col.setAttribute('stroke-width','0.5');
	 		net_col.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600 -res_y)+' l '+(500*myWidth1600)+',0');
	 		svg_col[cur_obb_col].appendChild(net_col);
		}
	}

	for (var i = 0; mas_niz *i < min_mid_sc; i++)
	{
		if (mas_niz *i > min_col)
		{
			res_y = (mas_niz *i- min_col)*delta_niz;

			var text_col = document.createElementNS("http://www.w3.org/2000/svg", 'text');
			text_col.innerHTML = svg_lichba(mas_niz *i);
	 		text_col.setAttribute('style',"font-family:Arial;font-size:10pt;font-color:white;text-anchor:right;");
	 		text_col.setAttribute('fill', 'black');
	 		text_col.setAttribute('y', (505*myWidth1600 -res_y));
			text_col.setAttribute('x', 5);
	 		svg_col[cur_obb_col].appendChild(text_col);
	 		text_col.setAttribute('x', 75*myWidth1600-text_col.clientWidth);

	 		var net_col = document.createElementNS("http://www.w3.org/2000/svg", 'path');
	 		svg_col[cur_obb_col].appendChild(net_col);
	 		net_col.setAttribute('stroke', 'black');
	 		net_col.setAttribute('stroke-width','0.5');
	 		net_col.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600 -res_y)+' l '+500*myWidth1600 +',0');
		}
	}

	var net_col = document.createElementNS("http://www.w3.org/2000/svg", 'path'); // haryzantalnaya ramka
	 net_col.setAttribute('stroke', 'black');
	 net_col.setAttribute('stroke-width','2');
	 net_col.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600)+' l '+(500*myWidth1600)+',0');
	 svg_col[cur_obb_col].appendChild(net_col);
	var net_col = document.createElementNS("http://www.w3.org/2000/svg", 'path'); // vertykalnaya ramka
	 net_col.setAttribute('stroke', 'black');
	 net_col.setAttribute('stroke-width','2');
	 net_col.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600)+' l 0,'+(-420*myWidth1600));
	 svg_col[cur_obb_col].appendChild(net_col);

	del = 500*myWidth1600 /legend_col[cur_obb_col][0].length;


	sort = [];


 	for (var i = 0; i < legend_col[cur_obb_col][0].length; i++)
	 {
	 text_col = document.createElementNS("http://www.w3.org/2000/svg", 'text');
	 text_col.setAttribute('style',"font-family:Arial;font-size:10pt;font-color:white;writing-mode:tb-rl;");
	 text_col.setAttribute('fill', 'black');
	 text_col.setAttribute('x', (i*del)-(-80*myWidth1600));
	 text_col.setAttribute('y', 505*myWidth1600);
	 text_col.innerHTML = legend_col[cur_obb_col][0][i] ;
	 svg_col[cur_obb_col].appendChild(text_col);
	}

	for (var i = 0; i < arr_col[cur_obb_col].length; i++)
	{
		 svg_col[cur_obb_col].ooo[i] = [];

		for (var j = 0; j < arr_col[cur_obb_col][i].length-1; j++) //-1
		{
		var rect_c = document.createElementNS("http://www.w3.org/2000/svg", 'path');
		rect_c.i = i;
		rect_c.j = j;
		rect_c.x = j*del-(-80*myWidth1600);

		 if (arr_col[cur_obb_col][i][j] < mid_sc)
			 	res_y = (arr_col[cur_obb_col][i][j]- min_col)*delta_verh;
			 else                   //+                                        //+
			 	res_y = (min_mid_sc-min_col   -(min_mid_sc -arr_col[cur_obb_col][i][j])/mult_col[cur_obb_col])*delta_niz;

     	 	if (arr_col[cur_obb_col][i][j-(-1)] < mid_sc)
			 	res_y1 = (arr_col[cur_obb_col][i][j-(-1)]- min_col)*delta_verh;
			 else                   //+                                        //+
			 	res_y1 = (min_mid_sc-min_col   -(min_mid_sc -arr_col[cur_obb_col][i][j-(-1)])/mult_col[cur_obb_col])*delta_niz;

		res_l = res_y - res_y1;

		rect_c.y = 500*myWidth1600 - res_y;







		if (i == 0) 	{
				sort[j] = [];
				arrx[cur_obb_col][j] = j*del- (-80*myWidth1600 -svg_col[cur_obb_col].posX);
				}
		sort[j][i] = rect_c.y- (-svg_col[cur_obb_col].posY);





		rect_c.l = res_l;

		rect_c.setAttribute('stroke', colors[i]); rect_c.setAttribute('stroke-width','2');
		rect_c.setAttribute('style', 'z-index:1;');
	    	rect_c.obb_col = cur_obb_col;
		rect_c.unhide_col = function (key)
			{ function a1(el_col, key) { el_col.n++;

	        var sinus = Math.sin(Math.PI *(el_col.n -key*(-10))/20);

			el_col.setAttribute('d','M '+el_col.x+',' + (el_col.y - (500*myWidth1600 -el_col.y) *(sinus-1)) +' l '+del+','+ (el_col.l*sinus));

			if (el_col.n  < 11) setTimeout(function(){ a1(el_col, key);}, 25); }

			this.n = 0; a1(this, key); }



/*
		rect_c.onmouseover = function () { this.show = true; prev_el_col[cur_obb_col].show = false; prev_el_col[cur_obb_col] = this;

		if (prev_x_col[cur_obb_col] != -1) { n_tras_col = 0; tras_col((this.x - prev_x_col[cur_obb_col]), (this.y - prev_y_col[cur_obb_col]), prev_x_col[cur_obb_col], prev_y_col[cur_obb_col], this ); } else
		box_col[cur_obb_col].setAttribute('transform', 'translate(' + this.x + ', '+ (this.y -300*myWidth1600)+')');
		desc_col[cur_obb_col].setAttribute('transform', 'translate(' + (this.x-(-25)) + ', '+ (this.y -275*myWidth1600)+')');

		prev_x_col[cur_obb_col] = this.x; prev_y_col[cur_obb_col] = this.y;

		 box_col[cur_obb_col].style.display = 'block';
		 desc_col[cur_obb_col].style.display = 'block';
		 desc_col[cur_obb_col].innerHTML = this.data;
								 }

 	rect_c.addEventListener("mouseover",
	     function () {
 				if (x_period[cur_obb_col] != this.j) { x_period[cur_obb_col] = this.j;  hide_slu("svg_slu" + this.obb_col); draw_slu(); unhide_slu("svg_slu" + this.obb_col); draw_w(); }
			}
	     , false);
*/


	     rect_c.addEventListener("mousedown",
	     function (e) {
	     		cur_obb_col = this.obb_col;
	     		if (!stacked_col[this.obb_col])
	     		{
	     		stacked_col[this.obb_col] = true;
	     		hide_col("svg_col"+this.obb_col);
				name_c[this.obb_col] = name_c[this.obb_col][ this.i ][1];
				arr_col[this.obb_col] = arr_s_col[this.obb_col][ this.i ].slice();
				}
			}
	     , false);

		rect_c.data = svg_text(name_c[cur_obb_col][i][0], 240*myWidth1600)+'<tspan x="35" dy="1.5em">' + svg_lichba(arr_col[cur_obb_col][i][j] ) +' '+ mera_col[cur_obb_col]+ '</tspan>';
		svg_col[cur_obb_col].appendChild(rect_c);
		svg_col[cur_obb_col].ooo[i][j] = rect_c;
		}
	}

	new_sort[cur_obb_col] = [];
	nom_sort[cur_obb_col] = [];
	for (c = 0; c < sort.length; c++)
	{
		new_sort[cur_obb_col][c] = [0];
		nom_sort[cur_obb_col][c] = [0];

		for (i = 0; i < sort[c].length; i++)
		{
			for (j = 0; j < new_sort[cur_obb_col][c].length; j++)
			{
			if (sort[c][i]< new_sort[cur_obb_col][c][j])
			break;
			}
			new_sort[cur_obb_col][c].splice(j,0,sort[c][i]);
			nom_sort[cur_obb_col][c].splice(j,0,i);
		}

		new_sort[cur_obb_col][c].splice(0,1);
		nom_sort[cur_obb_col][c].splice(0,1);
	}

		for (c = 0; c < sort.length; c++)
		{
				mid_sort[cur_obb_col][c] = [svg_col[cur_obb_col].posY];
			for (i = 0; i < new_sort[cur_obb_col][c].length-1; i++)
				mid_sort[cur_obb_col][c][i- -1] =  new_sort[cur_obb_col][c][i]/2 - -new_sort[cur_obb_col][c][i- -1]/2;

				mid_sort[cur_obb_col][c][ new_sort[cur_obb_col][c].length ] = 500*myWidth1600- -svg_col[cur_obb_col].posY;
		}

        mid_arrx[cur_obb_col] = [svg_col[cur_obb_col].posX];
			for (i = 0; i < arrx[cur_obb_col].length-1; i++)
				mid_arrx[cur_obb_col][i- -1] = arrx[cur_obb_col][i]/2 - -arrx[cur_obb_col][i- -1]/2;

				mid_arrx[cur_obb_col][ arrx[cur_obb_col].length ] = 600*myWidth1600- -svg_col[cur_obb_col].posX;


	window.addEventListener("mousemove",
	function(e)
	{
		if (n_tras_col == 0 )
		{
	  		var x = e.pageX;
	  		var y = e.pageY;

	  		/*var x1 = e.offsetX==undefined?e.layerX:e.offsetX;
	  		var y1 = e.offsetY==undefined?e.layerY:e.offsetY;   */

		    if (x < mid_arrx[cur_obb_col][0]) return;

			for (i = 0; i < mid_arrx[cur_obb_col].length -1; i++)
			if (x > mid_arrx[cur_obb_col][i] && x < mid_arrx[cur_obb_col][i- -1])
			break;

			if (i == mid_arrx[cur_obb_col].length -1) return;

			x = arrx[cur_obb_col][i] -svg_col[cur_obb_col].posX;

			if (y < mid_sort[cur_obb_col][i][0]) return;

			for (j = 0; j < mid_sort[cur_obb_col][i].length -1; j++)
				if (y > mid_sort[cur_obb_col][i][j] && y < mid_sort[cur_obb_col][i][j- -1])
				break;

			if (j == mid_sort[cur_obb_col][i].length -1) return;

			y = new_sort[cur_obb_col][i][j] -svg_col[cur_obb_col].posY;

			j = nom_sort[cur_obb_col][i][j];

			if (i_col_old != i || j_col_old != j)
			{
                   svg_col[cur_obb_col].removeChild(prev_rect_c4);
			var rect_c4 = document.createElementNS("http://www.w3.org/2000/svg", 'path');
			    rect_c4.setAttribute('fill', 'yellow');
			    rect_c4.setAttribute('stroke', 'blue');
				rect_c4.setAttribute('d','M'+x+','+y+' l0,-5 a5,5 0 1,1 0.0001,0 z');
				rect_c4.onmousedown=function(){n_tras_col=1; setTimeout('n_tras_col=0;', 5000);}
				svg_col[cur_obb_col].appendChild(rect_c4);
                prev_rect_c4 = rect_c4;

			i_col_old = i;
			j_col_old = j;

		 		svg_col[cur_obb_col].ooo[j][i].show = true;
		 		prev_el_col[cur_obb_col].show = false;
		 		prev_el_col[cur_obb_col] = svg_col[cur_obb_col].ooo[j][i];

				if (prev_x_col[cur_obb_col] != -1) {
				n_tras_col = 0;
				tras_col((x - prev_x_col[cur_obb_col]), (y - prev_y_col[cur_obb_col]), prev_x_col[cur_obb_col], prev_y_col[cur_obb_col], svg_col[cur_obb_col].ooo[j][i] ); } else
				{
				box_col[cur_obb_col].setAttribute('transform', 'translate(' + x + ', '+ (y -300*myWidth1600)+')');
				desc_col[cur_obb_col].setAttribute('transform', 'translate(' + (x-(-25)) + ', '+ (y -275*myWidth1600)+')');
				}
				prev_x_col[cur_obb_col] = x; prev_y_col[cur_obb_col] = y;

				 box_col[cur_obb_col].style.display = 'block';
				 desc_col[cur_obb_col].style.display = 'block';
				 desc_col[cur_obb_col].innerHTML = svg_col[cur_obb_col].ooo[j][i].data;

				if (x_period[cur_obb_col] != i)
					{
					x_period[cur_obb_col] = i;
					hide_slu("svg_slu" + cur_obb_col);
					draw_slu();
					unhide_slu("svg_slu" + cur_obb_col);
					draw_w();
					}
			}
		}
	}, false);
}



function unhide_col(id) {
els = document.getElementById(id).ooo;

for (var i = 0; i < els.length; i++)
{
for (var j = 0; j < els[i].length; j++)
{
els[i][j].unhide_col(0);
}
}
}

function hide_col(id) {
 els = document.getElementById(id).ooo;

for (var i = 0; i < els.length; i++)
for (var j = 0; j < els[i].length; j++)
els[i][j].unhide_col(1);

if ( stacked_col[cur_obb_col]) setTimeout(function(){ draw_col( arr_col[cur_obb_col], 'single'); unhide_col("svg_col" + cur_obb_col); }, 300);
}


function tras_col(x, y, pr_x, pr_y, el) {

if (!el.show) return;
n_tras_col++;
desc_col[cur_obb_col].setAttribute('transform', 'translate(' + (pr_x -(-x /10*n_tras_col -25)) + ', '+ (pr_y -(-y /10*n_tras_col)-275*myWidth1600) +')');
 box_col[cur_obb_col].setAttribute('transform', 'translate(' + (pr_x -(-x /10*n_tras_col)    ) + ', '+ (pr_y -(-y /10*n_tras_col)-300*myWidth1600) +')');

if (n_tras_col < 10) setTimeout(function(){ tras_col(x, y, pr_x, pr_y, el);}, 25);
else
n_tras_col = 0;
}

 // prev_el = [];


//   Ð ÑÐ ÑÐ âºÐ ÑÐ ÑÐ ÑÐ Â

var svg_slu   = [];
var desc_slu  = [];
var box_slu   = [];
var prev_el_slu = [];
var prev_x_slu= [];
var prev_y_slu= [];
var sc_slu = [];
var mult_slu = [];
var legend_slu = [];

function draw_slu() {

for (var obb_slu = 0; obb_slu < arr_s_col.length; obb_slu++)
{

//console.log('*svg_slu'+obb_slu);
//console.log('*' + document.getElementById('svg_slu'+obb_slu));

	svg_slu[obb_slu] = document.getElementById('svg_slu'+obb_slu);
	desc_slu[obb_slu] = document.getElementById('desc_slu'+obb_slu);
	box_slu[obb_slu] = document.getElementById('box_slu'+obb_slu);


	svg_slu[obb_slu].innerHTML = "";

/*
sc_slu[obb_slu] = arr_slu[obb_slu][0][1];
mult_slu[obb_slu] = arr_slu[obb_slu][0][2];
arr_slu[obb_slu].splice(0,1);
*/

///////////////////////

arr_slu[obb_slu] = [[[]]];

arr_slu[obb_slu][0][1] = sc_col[obb_slu];
arr_slu[obb_slu][0][2] = mult_col[obb_slu];

for (var i = 0; i < name_col[obb_slu][0].length; i++)
{
arr_slu[obb_slu][0][0][i] = name_col[obb_slu][0][i][0];
arr_slu[obb_slu][i-(-1)] = [];

for (var j = 0; j < arr_s_col[obb_slu][i].length; j++)
{
arr_slu[obb_slu][i-(-1)][j] = [];
arr_slu[obb_slu][i-(-1)][j][0] = arr_s_col[obb_slu][i][j][x_period[obb_slu]];
arr_slu[obb_slu][i-(-1)][j][1] =  name_col[obb_slu][0][i][1][j];
}
}
///////////////////////
legend_slu[obb_slu] = arr_slu[obb_slu].splice(0,1)[0];
sc_slu[obb_slu] = legend_slu[obb_slu][1];
mult_slu[obb_slu] = legend_slu[obb_slu][2];

sc_slu[obb_slu] =   sc_col[obb_slu];
mult_slu[obb_slu] = mult_col[obb_slu];

	max_slu = -1;
	min_slu = 0;
	svg_slu[obb_slu].aaa = [];

	prev_x_slu[obb_slu] = -1;
	prev_y_slu[obb_slu] = -1;

	for (var i = 0; i < arr_slu[obb_slu].length; i++)
	{
	sum = 0;
	for (var j = 0; j < arr_slu[obb_slu][i].length; j++)
	sum -=- arr_slu[obb_slu][i][j][0];

	if (sum > max_slu) max_slu = sum;
	if (sum < min_slu) min_slu = sum;
	}



min_slu = min_slu - ((max_slu - min_slu)/mult_slu[obb_slu] -(-min_slu))/10;


var mid_slu = (max_slu - min_slu)/mult_slu[obb_slu] -(-min_slu);
                       // sc_slu[obb_slu] agulna zamenena na mid_slu
 var delta = 400*myWidth1600/( (max_slu-mid_slu)/mult_slu[obb_slu] - (min_slu-mid_slu));

		net_slu = document.createElementNS("http://www.w3.org/2000/svg", 'path');
	 	net_slu.setAttribute('stroke', 'green');
	 	net_slu.setAttribute('stroke-width','1');
	 	net_slu.setAttribute('d','M 10,'+(500*myWidth1600-(mid_slu - min_slu)*delta)+' l '+(570*myWidth1600)+',0');
	 	svg_slu[obb_slu].appendChild(net_slu);

	var del = 500*myWidth1600 /legend_slu[obb_slu][0].length;

 	for (var i = 0; i < legend_slu[obb_slu][0].length; i++)
	 {
	 text_slu = document.createElementNS("http://www.w3.org/2000/svg", 'text');
	 text_slu.setAttribute('style',"font-family:Arial;font-size:10pt;font-color:white;");
	 text_slu.setAttribute('fill', 'black');
	 text_slu.setAttribute('x', (i*del)-(-80*myWidth1600));
	 text_slu.setAttribute('y', 520*myWidth1600);
	 text_slu.innerHTML = legend_slu[obb_slu][0][i];

	 svg_slu[obb_slu].appendChild(text_slu);
	}

	for (var i = 0; i < arr_slu[obb_slu].length; i++)
	{
	var res_y0 = 0;
	var sum  = 0;
	svg_slu[obb_slu].aaa[i] = [];

	for (var j = 0; j < arr_slu[obb_slu][i].length; j++)
		{

			sum -=- arr_slu[obb_slu][i][j][0];

			if (sum < mid_slu)
			 	res_y = sum;
			else                   //+                                        //+
			 	res_y = -(-mid_slu -(sum -mid_slu)/mult_slu[obb_slu]);

		rect_slu = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
		rect_slu.setAttribute('x', (i*150*myWidth1600)-(-80*myWidth1600));
		rect_slu.setAttribute('y', 500*myWidth1600-res_y*delta );	//
		rect_slu.firsty = 500*myWidth1600-res_y*delta;		//;
		rect_slu.setAttribute('width', '30');


		rect_slu.setAttribute('height', (res_y-res_y0)*delta);		//	//arr_slu[obb_slu][i][j][0] *delta;
		rect_slu.hi = (res_y-res_y0)*delta;				//			//arr_slu[obb_slu][i][j][0] *delta;


		rect_slu.setAttribute('fill', colors[j]);
		rect_slu.setAttribute('stroke', 'blue');
		rect_slu.setAttribute('style', 'z-index:1;');

		res_y0 = res_y;
		rect_slu.unhide_slu = function (key_slu)
		{
			function a1_slu(el, key_slu)
			{
			el.n++;

			el.setAttribute('y', el.firsty - (500*myWidth1600 -el.firsty) *(Math.sin(Math.PI *(el.n -key_slu*(-10))/20)-1) );
			el.setAttribute('height',  el.hi *Math.sin(Math.PI *(el.n -key_slu*(-10))/20) );
			if (el.n  < 9) setTimeout(function(){ a1_slu(el, key_slu);}, 25);
			}
		this.n = 0;

		a1_slu(this, key_slu);
		}
        rect_slu.obb_slu = obb_slu;
		rect_slu.onmouseover = function (e)
			{
				this.show = true;
				cur_obb_slu  = this.obb_slu;
				prev_el_slu[cur_obb_slu].show = false;
				prev_el_slu[cur_obb_slu] = this;

				if (prev_x_slu[cur_obb_slu] != -1)
				{
				tras_slu(0, (this.getAttribute('x') - prev_x_slu[cur_obb_slu]), (this.getAttribute('y') - prev_y_slu[cur_obb_slu]), prev_x_slu[cur_obb_slu], prev_y_slu[cur_obb_slu], this );
				}
				else
				{
				box_slu[cur_obb_slu].setAttribute('transform', 'translate(' + this.getAttribute('x') + ', '+ (this.getAttribute('y') -300*myWidth1600)+')');
				desc_slu[cur_obb_slu].setAttribute('transform', 'translate(' + (this.getAttribute('x')-(-20)) + ', '+ (this.getAttribute('y') -280*myWidth1600)+')');
				}

				prev_x_slu[cur_obb_slu] = this.getAttribute('x');
				prev_y_slu[cur_obb_slu] = this.getAttribute('y');


				 box_slu[cur_obb_slu].style.display = 'block';
				 desc_slu[cur_obb_slu].style.display = 'block';
				 desc_slu[cur_obb_slu].innerHTML = this.data;
			}

		rect_slu.data = svg_text(arr_slu[obb_slu][i][j][1][0] , 240*myWidth1600)+ '<tspan x="35" dy="1.5em">' + svg_lichba(arr_slu[obb_slu][i][j][0])+' '+ mera_col[obb_slu]+'</tspan>';
		svg_slu[obb_slu].appendChild(rect_slu);
		svg_slu[obb_slu].aaa[i][j] = rect_slu;
		}
	}


//console.log(max_slu+'-'+mid_slu);
//console.log(min_slu+'-'+mid_slu);
//console.log(obb_slu+'('+(max_slu-mid_slu)+'/'+mult_slu[obb_slu]  +')/('+(max_slu-mid_slu)/mult_slu[obb_slu] +'-'+ (min_slu-mid_slu)+')');

var delq_verh = Math.floor(   (max_slu-mid_slu)/mult_slu[obb_slu] / ( (max_slu-mid_slu)/mult_slu[obb_slu] - (min_slu-mid_slu))*20 );//-(-0.001);
var delq_niz = Math.floor(   (mid_slu-min_slu) / ( (max_slu-mid_slu)/mult_slu[obb_slu] - (min_slu-mid_slu))*20 );//-(-0.001);

uuu_niz = 1;
for (eje_niz = 0.0000000001; eje_niz*uuu_niz*delq_niz < mid_slu; )
{
eje_niz *= 10;

for (uuu_niz = 1; uuu_niz < 10 && eje_niz*uuu_niz*delq_niz < mid_slu; )
	uuu_niz++;
}

uuu_verh = 1;
for (eje_verh = 0.0000000001; eje_verh*uuu_verh*delq_verh < max_slu; )
{
eje_verh *= 10;

for (uuu_verh = 1; uuu_verh < 10 && eje_verh*uuu_verh*delq_verh < max_slu; )
	uuu_verh++;
}

mas_niz = eje_niz*uuu_niz;
mas_verh =eje_verh*uuu_verh;

//console.log('min_slu ='+min_slu);

	for (var i = 0; i <= Math.floor( max_slu/mas_verh )-(-1); i++)
	{
		if (mas_verh *i > mid_slu)
		{
			res_y = (mid_slu-min_slu   -(mid_slu -mas_verh *i)/mult_slu[obb_slu])*delta;

			var text_slu = document.createElementNS("http://www.w3.org/2000/svg", 'text');
			text_slu.innerHTML = svg_lichba(mas_verh *i);
	 		text_slu.setAttribute('style',"font-family:Arial;font-size:10pt;font-color:white;");
	 		text_slu.setAttribute('fill', 'black');
	 		text_slu.setAttribute('y', (505*myWidth1600 -res_y));
			text_slu.setAttribute('x', 5);
	 		svg_slu[obb_slu].appendChild(text_slu);
	 		text_slu.setAttribute('x', 75*myWidth1600-text_slu.clientWidth);

	 		var net_slu = document.createElementNS("http://www.w3.org/2000/svg", 'path');
	 		net_slu.setAttribute('stroke', 'black');
	 		net_slu.setAttribute('stroke-width','0.5');
	 		net_slu.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600 -res_y)+' l '+(500*myWidth1600)+',0');
	 		svg_slu[obb_slu].appendChild(net_slu);
		}
	}

	//console.log(mid_slu+'/'+mas_niz);


	for (var i = 0; mas_niz *i < mid_slu; i++)
	{
		if (mas_niz *i > min_slu)
		{
			res_y = (mas_niz *i- min_slu)*delta;

			var text_slu = document.createElementNS("http://www.w3.org/2000/svg", 'text');
	 		text_slu.setAttribute('style',"font-family:Arial;font-size:10pt;font-color:white;");
	 		text_slu.setAttribute('fill', 'black');
	 		text_slu.setAttribute('x', 5);
	 		text_slu.setAttribute('y', (505*myWidth1600 -res_y));
			text_slu.innerHTML = svg_lichba(mas_niz *i);
	 		svg_slu[obb_slu].appendChild(text_slu);
			text_slu.setAttribute('x', 75*myWidth1600-text_slu.clientWidth);

	 		var net_slu = document.createElementNS("http://www.w3.org/2000/svg", 'path');
	 		net_slu.setAttribute('stroke', 'black');
	 		net_slu.setAttribute('stroke-width','0.5');
	 		net_slu.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600 -res_y)+' l '+(500*myWidth1600)+',0');
	 		svg_slu[obb_slu].appendChild(net_slu);
		}
	}

	var net_slu = document.createElementNS("http://www.w3.org/2000/svg", 'path'); // haryzantalnaya ramka
	 net_slu.setAttribute('stroke', 'black');
	 net_slu.setAttribute('stroke-width','2');
	 net_slu.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600)+' l '+(500*myWidth1600)+',0');
	 svg_slu[obb_slu].appendChild(net_slu);
	var net_slu = document.createElementNS("http://www.w3.org/2000/svg", 'path'); // vertykalnaya ramka
	 net_slu.setAttribute('stroke', 'black');
	 net_slu.setAttribute('stroke-width','2');
	 net_slu.setAttribute('d','M '+(80*myWidth1600)+','+(500*myWidth1600)+' l 0,'+(-420*myWidth1600));
	 svg_slu[obb_slu].appendChild(net_slu);

	prev_el_slu[obb_slu] = [];
}
}

function unhide_slu(id)
{
//console.log('unhide_slu='+id);

els = document.getElementById(id).aaa;
for (var i = 0; i < els.length; i++)
for (var j = 0; j < els[i].length; j++)
{
//console.log('els['+i+']['+j+'].unhide_slu(0);');
els[i][j].unhide_slu(0);
}

//console.log('end unhide_slu='+id);
}

function hide_slu(id)
{
//console.log('hide_slu='+id);

els = document.getElementById(id).aaa;
for (var i = 0; i < els.length; i++)
for (var j = 0; j < els[i].length; j++)
els[i][j].unhide_slu(1);

//console.log('end hide_slu='+id);
}


function tras_slu(n, x, y, pr_x, pr_y, el) {
if (!el.show) return;
n++;

box_slu[cur_obb_slu].setAttribute('transform', 'translate(' + (pr_x -(-x /10*n)) + ', '+ (pr_y -(-y /10*n)-(300*myWidth1600)) +')');
desc_slu[cur_obb_slu].setAttribute('transform', 'translate(' + (pr_x -(-x /10*n)-(-20)) + ', '+ (pr_y -(-y /10*n)-(280*myWidth1600)) +')');

if (n < 10) setTimeout(function(){ tras_slu(n, x, y, pr_x, pr_y, el);}, 25);
}


           // Ð ÑÐ Â Ð ÐÐ âÐ Â
function po(R,ang)
{
ang *= Math.PI;
var x = Math.sin(ang)*R;
var y = -Math.cos(ang)*R;
ar2323=[x,y];
return ar2323;
}

function trans(el)
{
i_start = 0;
str = el.getAttribute("d");
spl = str.split(" ");
var dx = (spl[1].split(",")[0].substr(1, spl[1].split(",")[0].length-1)*2-(-spl[5].split(",")[0]))/20/10;
var dy = (spl[1].split(",")[1]*2-(-spl[5].split(",")[1]))/20/10;
if (spl[4].split(",")[0] == 1) { dx *= -1; dy *= -1; }
return [dx,dy];
}

svg = [];
arr = [];
arr_path = [];
arr_crcl = [];
box = [];
desc = [];

clr = ['green', 'blue', 'black', 'yellow', 'red', 'gold', 'crimson','chartreuse','Indigo','Maroon', 'MidnightBlue','Navy','RoyalBlue','SteelBlue'];


function draw_w()
{
for (var obb = 0; obb < arr_s_col.length; obb++)
{
/////////////////////////////////////////////
//console.log(x_period[obb]+ ' x_period[obb]' );

arr_w[obb] = [];

for (var i = 0; i < arr_s_col[obb].length; i++)
{
arr_w[obb][i] = [[],[]];

for (var j = 0; j < arr_s_col[obb][i].length; j++)
{
arr_w[obb][i][0][j] = [];
arr_w[obb][i][0][j][0] = arr_s_col[obb][i][j][x_period[obb]];
arr_w[obb][i][0][j][1] =  name_col[obb][0][i][1][j][0];
}

arr_w[obb][i][1] = name_col[obb][0][i][0];
}
console.log(3096);
console.log(document.getElementById('setting123'));
/////////////////////////////////////////////
	svg[obb] = 	document.getElementById('svg'+obb);
	desc[obb]= 	document.getElementById('desc_'+obb);
	box[obb] = 	document.getElementById('box_'+obb);
	arr[obb] = 	[];
	svg[obb].innerHTML = "";
	svg[obb].style.display = crkl_displ[obb];

	var sum = 0;
	for (var i = 0; i < arr_w[obb].length; i++)
	{
	arr[obb][ i] = 0;

			for (j = 0; j < arr_w[obb][i][0].length; j++)
			arr[obb][ i] -=- arr_w[obb][i][0][j][0];   //arr[obb].length-1

	sum -= -arr[obb][ i];
	}
	sum /= 2;

	for (var i = 0; i < arr_w[obb].length; i++)
	{
		arr[obb][ i] /= sum;

		for (j = 0; j < arr_w[obb][i][0].length; j++)
		arr_w[obb][i][0][j][0] /= sum;
	}

	arr_path[obb] = [];
	arr_crcl[obb] = [];

	var f_x = last_x = last_x2 = 0, f_y = last_y = -150*myWidth1600, f_y2 = last_y2 = -250*myWidth1600, last_ang2 = last_ang = 0;

	for (var i = 0; i < arr[obb].length; i++)
	{
		path = document.createElementNS("http://www.w3.org/2000/svg", 'path');
		 	ang = arr[obb][i] -(-last_ang);

			res = po(150*myWidth1600, ang);

		if (arr[obb][i] > 1.)
{
			refl = '1,1';
path.x = 200*myWidth1600 -last_x -(res[0]-last_x)/2;
path.y = 225*myWidth1600 -last_y -(res[1]-last_y)/2;
}
		else
{
path.x = 200*myWidth1600 -(-last_x -(res[0]-last_x)/2);
path.y = 225*myWidth1600 -(-last_y -(res[1]-last_y)/2);
			refl = '0,1';
}

if (ang < 1.)
path.x += 150*myWidth1600;
else
path.x -= 100*myWidth1600;
		path.setAttribute("d","M"+(275*myWidth1600)+','+(275*myWidth1600)+" l"+last_x+","+last_y+" a"+(150*myWidth1600)+','+(150*myWidth1600)+" 0 "+refl+" "+(res[0]-last_x-0.0001)+","+(res[1]-last_y)+" z");

		path.setAttribute("fill", clr[i]);

		arr_path[obb][arr_path[obb].length ] = path;
		path.t = 0;
		path.open = false;
		path.obb = obb;
		path.data = svg_text(arr_w[obb][i][1]+ ', ' + ( arr[obb][i]*50 ).toFixed(1) + '%,', 240*myWidth1600)+'<tspan x="35" dy="1.5em">'  + svg_lichba( arr[obb][ i]*sum*2)+' '+ mera_col[obb];

		path.onmousemove = function ()
					{
						cur_obb = this.obb;
						desc[cur_obb].innerHTML = this.data;

						box[cur_obb].setAttribute('transform', 'translate(' + this.x + ', '+ (this.y -300*myWidth1600)+')');
						desc[cur_obb].setAttribute('transform', 'translate(' + (this.x-(-20)) + ', '+ (this.y -275*myWidth1600)+')');


						desc[cur_obb].style.display = 'block';
						box[cur_obb].style.display = 'block';
					}

		path.onmousedown = function ()
			{
				for (var i = 0; i < arr_path[this.obb].length; i++)
				if (arr_path[this.obb][i] === this)
				{
					this.open = !this.open;

					if (!this.open)
					{
					desc[cur_obb].style.display = 'none';
					 box[cur_obb].style.display = 'none';
					}
				}
				else
					arr_path[this.obb][i].open = false;

					//so();
			}
		svg[obb].appendChild(path);

		          arr_crcl[obb][arr_crcl[obb].length] = [];

		               for (var j = 0; j < arr_w[obb][i][0].length; j++)
				{
						if (arr_w[obb][i][0][j][0] > 1.)
						{
							ang2 = arr_w[obb][i][0][j][0] -(-last_ang2);   //ang2 = 2 - arr_w[obb][i][0][j][0];
							refl = '1,1';
							refl2 = '1,0';
						}
						else
						{
							refl = '0,1';
							refl2 = '0,0';
							ang2 = arr_w[obb][i][0][j][0] -(-last_ang2);
						}
						res2 = po(250*myWidth1600, ang2);

		                  path2 = document.createElementNS("http://www.w3.org/2000/svg", 'path');
					path2.x = 275*myWidth1600-(-last_x2)/5*4;
					path2.y = 275*myWidth1600-(-last_y2)/5*4;



		                  path2.setAttribute("d","M"+(275*myWidth1600-(-last_x2)/5*4)+","+(275*myWidth1600-(-last_y2)/5*4)+"  l"+(last_x2/5)+","+(last_y2/5)+" a"+(250*myWidth1600)+','+(250*myWidth1600)
		                  +" 0 "+refl+"  "+(res2[0]-last_x2)+","+(res2[1]-last_y2)+
		" l"+(- res2[0]/5)+","+(- res2[1]/5)+" a"+(200*myWidth1600)+','+(200*myWidth1600)+" 0 "+refl2+"  "+(-(res2[0]-last_x2)/5*4)+","+(-(res2[1]-last_y2)/5*4)+"  z");
		                  path2.setAttribute("fill", clr[j]);
				  path2.data = svg_text(arr_w[obb][i][0][j][1] + ', ' + ( arr_w[obb][i][0][j][0]*50 ).toFixed(1) + '%, ', 240*myWidth1600)+'<tspan x="35" dy="1.5em">' + svg_lichba( arr_w[obb][i][0][j][0]*sum*2 )+' '+ mera_col[obb];
				  path2.cur_obb = obb;
				  path2.onmouseover = function ()
								{
								cur_obb = this.cur_obb;
								desc[cur_obb].innerHTML = this.data;

							box[cur_obb].setAttribute('transform', 'translate(' + this.x + ', '+ (this.y -250*myWidth1600)+')');
							desc[cur_obb].setAttribute('transform', 'translate(' + (this.x-(-20)) + ', '+ (this.y -225*myWidth1600)+')');

								desc[cur_obb].style.display = 'block';
								box[cur_obb].style.display = 'block';
								}

		                  		  last_x2 = res2[0];
						  last_y2 = res2[1];
						  last_ang2 = ang2;
						  svg[obb].appendChild(path2);
						  arr_crcl[obb][arr_crcl[obb].length-1 ][ arr_crcl[obb][arr_crcl[obb].length-1 ].length ] = path2;
				}
		last_x = res[0];
		last_y = res[1];

		last_ang = ang;

	}
}

so();
}//[obb]


var time_id;
so = function()
{
//for (obb = 0; obb < arr_w.length; obb++)
//{
obb = cur_obb_col;

	for (var i = 0; i < arr_path[obb].length; i++)
	{
		if (arr_path[obb][i].open && arr_path[obb][i].t < 10)
		{
				arr_path[obb][i].t++;
		}
		else
		if (!arr_path[obb][i].open && arr_path[obb][i].t > 0) arr_path[obb][i].t--;

		arr2 = trans(arr_path[obb][i]);

		arr_path[obb][i].setAttribute('transform', 'translate('+(arr2[0]*Math.sin(Math.PI *arr_path[obb][i].t/20)*10)+','+(arr2[1]*Math.sin(Math.PI *arr_path[obb][i].t/20)*10)+')');



		if (arr_path[obb][i].t == 0)
		{
			for (var j = 0; j < arr_crcl[obb][i].length; j++)
				arr_crcl[obb][i][j].style.display = 'none';
		}
		else
		for (var j = 0; j < arr_crcl[obb][i].length; j++)
		{
			arr_crcl[obb][i][j].style.display = 'block';
			arr_crcl[obb][i][j].setAttribute('opacity', (arr_path[obb][i].t/10));
		}
	}
//}
setTimeout( so, 20);     //time_id =
}



/// Ð¡ÐÐ¡âÐ Ñ Ð ÐÐ Â°Ð¡â¡Ð Â°Ð Â»Ð Ñ Ð ÑÐ ÑÐ ÐÐ ÑÐ¡ÐÐ ÑÐ¡âÐ Â° Ð ÑÐ¡â¹Ð¡â¬Ð¡ÐÐ¡Ð
		var html = document.documentElement;   
		var body = document.body;
		var x_start, y_start, krut_active = false, krut_active_node = 0, mouse_down_bool = false;

// k_e = new Object(); k_e.keyCode = 38; keyd(k_e); krut_active = false;

		k_e = new Object();
     mouse_move = function(e)
	{
		e = e || window.event

		e.pageX = e.clientX + (html && html.scrollLeft || body && body.scrollLeft || 0) - (html.clientLeft || 0)
		e.pageY = e.clientY + (html && html.scrollTop || body && body.scrollTop || 0) - (html.clientTop || 0)
		         if (krut_active && mouse_down_bool)
		         {

                   if (e.pageX - x_start > 50 && Math.abs(e.pageY - y_start) < 20) { k_e.keyCode = 39; keyd(k_e); krut_active = false;}
                   else
                   if (e.pageX - x_start < -50 && Math.abs(e.pageY - y_start) < 20) {  k_e.keyCode = 37; keyd(k_e); krut_active = false;}
                   else
                   if (e.pageY - y_start > 50 && Math.abs(e.pageX - x_start) < 20) { k_e.keyCode = 40; keyd(k_e); krut_active = false;}
                   else
                   if (e.pageY - y_start < -50 && Math.abs(e.pageX - x_start) < 20) { k_e.keyCode = 38; keyd(k_e); krut_active = false;}
		         }
	}

	mouse_down = function(e)
	{

			e = e || window.event
	     	mouse_down_bool = true

		e.pageX = e.clientX + (html && html.scrollLeft || body && body.scrollLeft || 0) - (html.clientLeft || 0)
		e.pageY = e.clientY + (html && html.scrollTop || body && body.scrollTop || 0) - (html.clientTop || 0)


                                  	arr = ['cube_str', 'cube_sto'];  //, 'cube_sto'
							for (i = 0; i < arr.length; i++)
							{
							element = document.getElementById(arr[i])  // Ð ÐÐ ÐÐ ÑÐ¡ÐÐ ÑÐ Ñ Ð Â·Ð ÐÐ Â°Ð¡â¡Ð ÂµÐ ÐÐ ÑÐ¡Ð id
							offsetLeft = element.offsetLeft,
							offsetTop = element.offsetTop  - element.offsetHeight + 120;
    							while (element.parentNode.offsetTop != null)
    		 					{
    		 					element = element.parentNode
        						offsetLeft -= - element.offsetLeft;
        						offsetTop  -= - element.offsetTop;
    							}

	    					if (e.pageX > offsetLeft && e.pageY > offsetTop && e.pageX < offsetLeft -(-document.getElementById(arr[i]).offsetWidth) && e.pageY < offsetTop -(-document.getElementById(arr[i]).offsetHeight))
	    						{
	    	 						//krut_active_node = arr[i].slice(-3);
	    	 						x_start = e.pageX;
	    	 						y_start = e.pageY;
	    	 						krut_active = true;
	    						}
	                        }

	}

	mouse_up = function(e)
	{
	     mouse_down_bool = false
	     krut_active = false
    }
	window.addEventListener('mousemove', mouse_move, false);
	//window.addEventListener('mousedown', mouse_down, false);
	window.addEventListener('mouseup', mouse_up, false);
////   Ð¡ÐÐ¡âÐ Ñ Ð ÑÐ ÑÐ ÐÐ ÂµÐ¡â  Ð ÑÐ ÑÐ ÐÐ ÑÐ¡ÐÐ ÑÐ¡âÐ Â°

var props = 'transform WebkitTransform MozTransform OTransform msTransform'.split(' '),
	prop,
	el = document.createElement('div');
	prop = 'WebkitTransform';

var xAngle = 0, yAngle = 0;
var X = [], Y = [], X_old = [], Y_old = [];



for (var i = 0; i < orien.length; i++)
for (var ie = 0; ie < arr_str[i].length; ie++)
{
	   		var div1 = document.createElement('div');
			document.getElementById(settingi[i]).appendChild(div1);
	   		var div2 = document.createElement('div');
	   		div1.appendChild(div2);
	   		div1.setAttribute('id', 'experiment_'+arr_str[i][ie]);
			div1.setAttribute('class', 'experiment_'+arr_stl[i][ie]);
            div2.setAttribute('z-index', 1);
	   		div2.setAttribute('id', 'cube_'+arr_str[i][ie]);
			div2.setAttribute('class', 'cube_'+arr_stl[i][ie]);

	for (var j = 0; j < col_str[i].length; j++)
		for (var c = 0; c < col_str[i][j].length; c++)
		{
			var div3 = document.createElement('div');
			var div4 = document.createElement('div');
	   		div3.appendChild(div4);
	   		div2.appendChild(div3);
	   		div3.setAttribute('id', col_str[i][j][c][ie]);
	   		div3.setAttribute('style', ' ');
	   		div3.setAttribute('class', 'hide');
		}

		for (var c = 0; c < 5; c++)
		{
 			var div3 = document.createElement('div');
 			var div4 = document.createElement('div');
 			div3.appendChild(div4);
	   		div2.appendChild(div3);
	   		div3.setAttribute('id', orien[i][c][ie]);
	   		div3.setAttribute('style', ' ');
	   		div3.setAttribute('class', 'face_' + arr_stl[i][ie] +' '+styles_types[c] +arr_stl[i][ie]);
		}
}



for (var i = 0; i < arr_str.length; i++)
{
X[i] = 0;
 Y[i] = 0;
 X_old[i] = 0;
 Y_old[i] = 0;
}


document.getElementById("cube_str").style.height = (Math.floor(myWidth*0.8)) + "px";
document.getElementById("cube_str").style.width = (Math.floor(myWidth*0.8)) + "px";

document.getElementById("cube_sto").style.height = (Math.floor(myWidth*0.1)) + "px";//0.1
document.getElementById("cube_sto").style.width = (Math.floor(myWidth*0.8)) + "px";
/*
document.getElementById("cube_small1").style.height = (Math.floor(myWidth*0.6)) + "px";
document.getElementById("cube_small1").style.width = (Math.floor(myWidth*0.6)) + "px";

document.getElementById("cube_small2").style.height = (Math.floor(myWidth*0.6)) + "px";
document.getElementById("cube_small2").style.width = (Math.floor(myWidth*0.6)) + "px";

document.getElementById("cube_sto_small1").style.height = (Math.floor(myWidth*0.1)) + "px";
document.getElementById("cube_sto_small1").style.width = (Math.floor(myWidth*0.6)) + "px";

document.getElementById("cube_sto_small2").style.height = (Math.floor(myWidth*0.1)) + "px";
document.getElementById("cube_sto_small2").style.width = (Math.floor(myWidth*0.6)) + "px";
*/

  // kolonki - slajdy

keyd = function(evt)
{
xAngle = 0;
 yAngle = 0;

	if (evt.keyCode == 37 )//&& krut_active_node == arr[0].slice(-3)
		{ // left
			xAngle = 90;
			X[krut_active_node]--;
     	}
     	else
     	if (evt.keyCode == 38 ) // && krut_active_node == arr[1].slice(-3)  - Ð ÂµÐ¡ÐÐ Â»Ð Ñ Ð¡â¦Ð ÑÐ¡âÐ ÑÐ Ñ Ð ÑÐ â¢ Ð ÑÐ¡ÐÐ¡ÑÐ¡âÐ ÑÐ¡âÐ¡Ð Ð âÐ â¢Ð Â Ð ÑÐ ÂÐ ÑÐ ÑÐ âºÐ Â¬Ð ÑÐ Ñ Ð ÐÐ ÑÐ Â¶Ð ÐÐ ÑÐ â - Ð ÐÐ ÂµÐ¡ÐÐ ÐÐ¡ÑÐ¡âÐ¡Ð
		{ // up
			yAngle = -90;
			Y[krut_active_node]--;
		}
		else
        if (evt.keyCode == 39 ) //&& krut_active_node == arr[0].slice(-3)
		{//case 39: // right
			xAngle = -90;
			X[krut_active_node]++;
        }
        else
        if (evt.keyCode == 40 ) // && krut_active_node == arr[1].slice(-3)  - Ð ÂµÐ¡ÐÐ Â»Ð Ñ Ð¡â¦Ð ÑÐ¡âÐ ÑÐ Ñ Ð ÑÐ â¢ Ð ÑÐ¡ÐÐ¡ÑÐ¡âÐ ÑÐ¡âÐ¡Ð Ð âÐ â¢Ð Â Ð ÑÐ ÂÐ ÑÐ ÑÐ âºÐ Â¬Ð ÑÐ Ñ Ð ÐÐ ÑÐ Â¶Ð ÐÐ ÑÐ â - Ð ÐÐ ÂµÐ¡ÐÐ ÐÐ¡ÑÐ¡âÐ¡Ð
		{//case 40: // down 
			yAngle = 90;
			Y[krut_active_node]++;
		}


    var n = 0;
	function starT() {        console.log(3504);
	var itv = 0;
	n++;
	n = n%2;
		function startTime() {
		itv++;

     		if (n == 1)
     		{
				id = setTimeout(startTime, 30);

						draw_slu();

				if (itv < 8)  {        console.log(3517+' ' +krut_active_node);
for (var i = 0; i < arr_str[krut_active_node].length; i++)
{
document.getElementById('experiment_' +arr_str[krut_active_node][i]).style['WebkitPerspective']-=50*(8-itv)*(8-itv);


//console.log('experiment_' +arr_str[krut_active_node][i]);
//document.getElementById('experiment_' +arr_str[krut_active_node][i]).style.opacity=1-0.005*itv*itv;
}
}
				else
				clearTimeout(id);
			}
			else
			if (n == 0)
			{
				id = setTimeout(startTime, 30);
				if (itv < 8)  {    console.log(3534);
for (var i = 0; i < arr_str[krut_active_node].length; i++)
{                                                      console.log(3536);
document.getElementById('experiment_' + arr_str[krut_active_node][i]).style['WebkitPerspective']-=-50*itv*itv;
//document.getElementById('experiment_' +arr_str[krut_active_node][i]).style.opacity=1-0.005*(8-itv)*(8-itv);
}
}
				else
				{
					clearTimeout(id);     console.log(3543);
					for (var i = 0; i < arr_str[krut_active_node].length; i++)
					{                                       console.log(3545);
					document.getElementById('experiment_' + arr_str[krut_active_node][i]).style['WebkitPerspective'] = 780000;

					for (var y = 0; y < containers.length; y++)
					{
                     console.log(3550);
					console.log(containers[y] +'=='+ col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i] + '   ' + n);
                                              console.log(3552);
						if (containers[y] == col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i])
						{
						cur_obb_col=y;  console.log('stacked_col['+cur_obb_col+']');
 						stacked_col[cur_obb_col] = false;
console.log(arr_s_col[cur_obb_col].slice()+"single");
						draw_col( arr_s_col[cur_obb_col].slice(),"single");
 						unhide_col("svg_col" + cur_obb_col);
						//draw_slu();
						unhide_slu("svg_slu" + cur_obb_col);

						}
					}

					for (var y = 0; y < settingi.length; y++)
					if (settingi[y] == col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i])
					{
					krut_active_node = y;
					keyd(k_e); krut_active = false;
					}

					}

					xAngle = 0;
   					yAngle = 0;
				}
			}
  		}



       console.log(3583);
     if (n ==1)   for (i = 0; i < arr_str[krut_active_node].length; i++)
{                                        console.log(3585);
 	document.getElementById('experiment_' + arr_str[krut_active_node][i]).style['WebkitPerspective'] = 7800;

	for (y = 0; y < containers.length; y++)
	{                        console.log(3589);
	console.log(col_str);
	console.log( 'krut_active_node '+krut_active_node + ' X_old[krut_active_node]'+X_old[krut_active_node]+' Y_old[krut_active_node]'+Y_old[krut_active_node]);
	console.log('containers['+y+']'+containers[y]);
	console.log('col_str['+krut_active_node+']');
	console.log(col_str[krut_active_node]);
	console.log(containers[y] +'=='+ col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i] + '   ' + n);
              console.log(3591);
	if (containers[y] == col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i])
	{
	cur_obb_col=y;
 	hide_col("svg_col" + cur_obb_col);
	hide_slu("svg_slu" + cur_obb_col);
	}
	}
}

     startTime();
  }


	starT();
	for (i = 0; i < arr_str[krut_active_node].length; i++)
		{
		if (X[krut_active_node] <= 0) X[krut_active_node] = 0;
		if (Y[krut_active_node] <= 0) Y[krut_active_node] = 0;

			if (X[krut_active_node] >= col_str[krut_active_node].length)   X[krut_active_node] = col_str[krut_active_node].length-1;

			if (Y[krut_active_node] >= col_str[krut_active_node][X[krut_active_node]].length)   Y[krut_active_node] = col_str[krut_active_node][X[krut_active_node]].length -1;


				document.getElementById("cube_" + arr_str[krut_active_node][i]).style["WebkitTransitionDuration"] = "0ms";
				document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).className = "face_"+arr_stl[krut_active_node][i]+" four_"+arr_stl[krut_active_node][i]; //"hide";


			if (xAngle == -90)   // right
			{
document.getElementById(orien[krut_active_node][0][i]).innerHTML = document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).innerHTML;
document.getElementById("cube_" + arr_str[krut_active_node][i]).style["WebkitTransform"] = "rotateX(0deg) rotateY(90deg)  translateZ(0px)";
document.getElementById(orien[krut_active_node][0][i]).setAttribute("style"," ");
document.getElementById(orien[krut_active_node][1][i]).setAttribute("style"," ");
document.getElementById(orien[krut_active_node][2][i]).setAttribute("style"," ");
document.getElementById(orien[krut_active_node][3][i]).setAttribute("style"," ");
document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).setAttribute("style"," ");
document.getElementById(col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i]).setAttribute("style"," ");
	 		} else
	 		if (xAngle == 90)    // left
			{
document.getElementById(orien[krut_active_node][1][i]).innerHTML = document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).innerHTML;
document.getElementById("cube_" + arr_str[krut_active_node][i]).style["WebkitTransform"] = "rotateX(0deg) rotateY(-90deg)  translateZ(0px)";
document.getElementById(orien[krut_active_node][0][i]).setAttribute("style"," ");
document.getElementById(orien[krut_active_node][1][i]).setAttribute("style"," ");
document.getElementById(orien[krut_active_node][2][i]).setAttribute("style"," ");
document.getElementById(orien[krut_active_node][3][i]).setAttribute("style"," ");
document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).setAttribute("style"," ");
document.getElementById(col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i]).setAttribute("style"," ");
	 		} else
	 		if (yAngle == 90)    //  down
			{
document.getElementById(orien[krut_active_node][2][i]).innerHTML = document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).innerHTML;
document.getElementById("cube_" + arr_str[krut_active_node][i]).style["WebkitTransform"] = "rotateX(-90deg) rotateY(0deg)  translateZ(0px)";
document.getElementById(orien[krut_active_node][0][i]).setAttribute("style","width:"	+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight) + "px;-webkit-transform: rotateY(-90deg)  translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+  "px);");
document.getElementById(orien[krut_active_node][1][i]).setAttribute("style","width:"	+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight) + "px;-webkit-transform: rotateY(90deg)   translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
document.getElementById(orien[krut_active_node][2][i]).setAttribute("style","-webkit-transform: rotateX(90deg)   translateZ("	+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2) + "px);");
document.getElementById(orien[krut_active_node][3][i]).setAttribute("style","-webkit-transform: rotateX(-90deg)  translateZ("	+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2) + "px);");
document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).setAttribute("style","-webkit-transform: rotateY(180deg) translateZ("+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2) +  "px);");
document.getElementById(col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i]).setAttribute("style","-webkit-transform: translateZ("+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2) +  "px);");

	 		} else
	 		if (yAngle == -90)   // up
			{
document.getElementById(orien[krut_active_node][3][i]).innerHTML = document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).innerHTML;
document.getElementById("cube_" + arr_str[krut_active_node][i]).style["WebkitTransform"] = "rotateX(90deg) rotateY(0deg)  translateZ(0px)"
document.getElementById(orien[krut_active_node][0][i]).setAttribute("style","width:"	+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight) + "px;-webkit-transform: rotateY(-90deg)  translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
document.getElementById(orien[krut_active_node][1][i]).setAttribute("style","width:"	+(document.getElementById(orien[krut_active_node][0][i]).offsetHeight) + "px;-webkit-transform: rotateY(90deg)   translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
document.getElementById(orien[krut_active_node][2][i]).setAttribute("style","-webkit-transform: rotateX(90deg)   translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
document.getElementById(orien[krut_active_node][3][i]).setAttribute("style","-webkit-transform: rotateX(-90deg)  translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
document.getElementById(col_str[krut_active_node][X_old[krut_active_node]][Y_old[krut_active_node]][i]).setAttribute("style","-webkit-transform: rotateY(180deg) translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
document.getElementById(col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i]).setAttribute("style","-webkit-transform: translateZ("+ (document.getElementById(orien[krut_active_node][0][i]).offsetHeight/2)+ "px);");
	 		}

			document.getElementById(orien[krut_active_node][4][i]).className = 'hide'; // dostatochno odin raz - nado optimizirovatj
	 		document.getElementById(col_str[krut_active_node][X[krut_active_node]][Y[krut_active_node]][i]).className = "face_"+arr_stl[krut_active_node][i]+" two_"+arr_stl[krut_active_node][i]; //"face_"+arr_str[krut_active_node][i]+"
		}

        xAngle = 0;
 yAngle = 0;

//console.log(document.getElementById('svg_col1').ooo + ' ooo5');


   	setTimeout('for (i = 0; i < arr_str['+krut_active_node+'].length; i++) {document.getElementById("cube_" + arr_str['+krut_active_node+'][i]).style["WebkitTransitionDuration"] = "800ms";'+
   	' document.getElementById("cube_" + arr_str['+krut_active_node+'][i]).style["WebkitTransform"] = "rotateX('+yAngle+'deg) rotateY('+xAngle+'deg)  translateZ(\" + (0)+\"px) ";}',240);


              X_old[krut_active_node] = X[krut_active_node];
              Y_old[krut_active_node] = Y[krut_active_node];
    setTimeout(starT, 1040);

};
window.addEventListener('keydown', keyd, false)


}

var keyd;

</script>  