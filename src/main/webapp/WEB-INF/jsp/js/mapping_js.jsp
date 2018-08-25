<%@ page contentType="text/html;charset=utf-8" language="java" %>



<script type="text/javascript">

 var lat;
 var lng;
 if (get_cookie("latlng"))
 {
                  latlng = get_cookie("latlng").split('@');
                       lat = latlng[0];
                       lng = latlng[1];
 }
 else
 {
 	       lat = 53.9300;
 	       lng = 27.6200;
 }

 
	function grabyanec (arr, lat, lng)
	{
		function paraunaj(a, b)
		{        // returns a > b
		      return -(-(lng - a[0])*(lng - a[0]) - (lat - a[1])*(lat - a[1])) >
		      -(-(lng - b[0])*(lng - b[0]) - (lat - b[1])*(lat - b[1]));
		}

		console.log('arr '+arr+' lat '+ lat+' lng '+ lng);

		var gap = arr.length;
		var swapped = false, i;
		while (gap > 1 || swapped)
		{
			if (gap > 1)
			gap = Math.floor(gap / 1.24733);
			i = 0;
			swapped = false;
			while (i + gap < arr.length)
			{
		    	if (paraunaj(arr[i], arr[i + gap]))
		    	{
		    	t = arr[i];
		    	arr.splice(i,1, arr[i + gap]);
		    	arr[i + gap] = t;
		    	 swapped = true;
		    	}
		    i++;
			}
		}
		//console.log('grabyanec'+arr_resp);
		return arr;
	}


function func_tr(w)
{
	console.log(w);
	console.log(w);
	var popup = L.popup();
		popup
			.setLatLng(w.latlng)
			.setContent("Координата точки " + w.latlng.lat)
			.setContent(i_m_here)
			.openOn(map);

			console.log(w.latlng);
			
			 

			var current_date = new Date;
		    var cookie_year = current_date.getFullYear();
		    var cookie_month = current_date.getMonth()- -1;
		    var cookie_day = current_date.getDate();
		    set_cookie( 'latlng', w.latlng.lat+'@'+w.latlng.lng, cookie_year, cookie_month, cookie_day );
		    
		    document.location.reload(true);
		    //mapping2(w.latlng.lng, w.latlng.lat, arr, 'start_load'); //mapping2

		    setTimeout(basket, 100);
}
function func_fl(){ }

var map;

function mapping(longt, latt, arr, geo_id)
{
	map = L.map('map').setView([latt, longt], 13);
	mapping2(longt, latt, arr, geo_id);
}

function mapping2(longt, latt, arr, geo_id)
{
if (geo_id != 'start_load')
{

			grab = grabyanec(arr, lat, lng);

			for (i = 0; i < grab.length; i++)
			{																					console.log(geo_id+i);
			 document.getElementById(geo_id+i).innerHTML = "<b>" + grab[i][2]+'</b> от Вас в '+
			 Math.floor(Math.sqrt(-(-(lng - grab[i][0])*(lng - grab[i][0])
			 - (lat - grab[i][1])*(lat - grab[i][1])))*111194)+' м';
			}
}

len = document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes.length-1;
for (;len >= 0; len--)
{
document.getElementsByClassName('leaflet-shadow-pane')[0].removeChild(document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes[len]);
document.getElementsByClassName('leaflet-marker-pane')[0].removeChild(document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len]);
}

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
maxZoom: 18,
attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
'Imagery © <a href="http://mapbox.com">Mapbox</a>',
id: 'mapbox.streets'
}).addTo(map);

		for (i = 0; i < arr.length; i++)
		{
		L.marker([arr[i][1], arr[i][0]]).addTo(map)
			.bindPopup("<a href='absolutbank.by'>" + arr[i][2]+"</a>").openPopup();

		/*el = document.createElement('a');
		el.innerHTML = arr[i][2];
		el.id = i;
		el.onmousedown = function (){ poper(this.id)};
     document.getElementById('ee').appendChild(el);*/
		}

	var popup = L.popup();

	function onMapClick(e) {
		/*popup
			.setLatLng(e.latlng)
			//.setContent("Координата точки " + e.latlng.toString())
			.setContent("Я нахожусь здесь!")
			.openOn(map); */
			ale(start_point+'?', func_tr, func_fl, e);
	}

	L.marker([latt, longt]).addTo(map)
		.bindPopup(i_m_here+'!</b>').openPopup();

	map.on('click', onMapClick);
}


function ale(msg, f_tr, f_fl, w)
{                           console.log(f_tr);
document.getElementById('msg').style.display = 'block';
document.getElementById('msg_text').innerHTML = msg;
document.getElementById('msg').getElementsByTagName('BUTTON')[0].onmousedown = function(){ this.parentNode.style.display='none'; f_tr(w);}
document.getElementById('msg').getElementsByTagName('BUTTON')[1].onmousedown = function(){ this.parentNode.style.display='none'; f_fl();}
}


function add_circle(radius, geo, krama_nazva, type, id)
{
if (!!document.getElementsByClassName('leaflet-overlay-pane')[0].getElementsByTagName('svg')[0])
{
document.getElementsByClassName('leaflet-overlay-pane')[0].getElementsByTagName('svg')[0].innerHTML = "";
}

console.log('ahttp://test1.ru/include_android.php?key=pokupnik&key_tip_operazii='+type+'&radius='+radius+'&id_radius='+id);

http.open('get', 'http://localhost:8159/Eximer/Controller?command='+type+'&radius='+radius+'&id_radius='+id);
http.onreadystatechange = '';
http.send(null);

L.circle([geo[1], geo[0]], radius,{
color: 'red',
fillColor: '#f03',
fillOpacity: 0.5
}).addTo(map)
			.bindPopup(krama_nazva).openPopup();
}

var arr = [[27.6200,53.9300,"касса2"], [27.6000,53.9000,"касса1"], [27.6100,53.9200,"банкомат1"]];
                   mapping(lat, lng, arr, 'start_load');
                     var prev_act_s = document.getElementById('nul');
                     var prev_i = 0;
     function poper(i)
     {
     if (i == prev_i) return;
     prev_i = i;
     var evt = document.createEvent("HTMLEvents");
		evt.initEvent("click", true, true);
     document.getElementsByClassName('leaflet-marker-pane')[0].getElementsByTagName('IMG')[i].dispatchEvent(evt);
     }



     var lat;
     var lng;
     if (get_cookie("latlng"))
     {
                      latlng = get_cookie("latlng").split('@');
                           lat = latlng[0];
                           lng = latlng[1];
     }
     else
     {
     	       lat = 53.9300;
     	       lng = 27.6200;
     }

</script>  