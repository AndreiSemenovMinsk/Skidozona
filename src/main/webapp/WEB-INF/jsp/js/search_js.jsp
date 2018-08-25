<%@ page contentType="text/html;charset=utf-8" language="java" %>
<script type="text/javascript">
/**
 *
 */


 function searchMenu()
 {
 	if(http.readyState == 4)
 	{
 	document.getElementById('uadkaz').innerHTML = http.responseText;
 	}
 }
 function searchMenu_approve()
 {
 	if(http.readyState == 4)
 	{
 	document.getElementById('approve').innerHTML = http.responseText;
 	}
 }

 
	var actual_tip;

	 function menu( categories)
	{
		 actual_tip = categories;

	if (cana_min != 0 && cana_max != 0)
	{    console.log('menu 0');
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=menu&tip='+actual_tip+'&max='+cana_max+'&min='+cana_min+'&clientWidth='+myWidth+'&comp='+comp+'&sort_cana_dir='+sort_cana_dir);
	}
	else
	if (cana_min != 0)
	{    console.log('menu 1');
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=menu&tip='+actual_tip+'&min='+cana_min+'&clientWidth='+myWidth+'&comp='+comp+'&sort_cana_dir='+sort_cana_dir);
	}
	else
	if (cana_max != 0)
	{    console.log('menu 2');
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=menu&tip='+actual_tip+'&max='+cana_max+'&clientWidth='+myWidth+'&comp='+comp+'&sort_cana_dir='+sort_cana_dir);
	}
	else
	{    console.log('menu 3');
	http.open('get', 'http://localhost:8159/Eximer/Controller?command=menu&tip='+actual_tip+'&clientWidth='+myWidth+'&comp='+comp+'&sort_cana_dir='+sort_cana_dir);
	}
	http.onreadystatechange =  search_resp;
	http.send(null);
	}
 
 

 var cana_timeout_id;
 function upd_cana()
 {
 clearTimeout(cana_timeout_id);

 if (document.getElementById('inputSearch').value !='') { search_text=document.getElementById('inputSearch').value; search_bool = true; search(1); }
 else
 menu(actual_tip);
 }


 var menu_level = 1; // для телефона

 if( typeof( window.innerWidth ) == 'number' )
 { //Non-IE
   myWidth = window.innerWidth;
   myHeight = window.innerHeight;
 }
 else
 if( document.documentElement && ( document.documentElement.clientWidth ||
 document.documentElement.clientHeight ) )
 {//IE 6+ in 'standards compliant mode'
  myWidth = document.documentElement.clientWidth;
  myHeight = document.documentElement.clientHeight;
 }


 var search_text, timeout_id, search_bool = true;
 var cana_min = 0, cana_max = 0, sort_cana_dir = 'DESC';

 if (myWidth < myHeight)
 {
 comp = false;
 document.write("<div id='map' style='width:"+(myWidth*0.9)+"px;height:"+(myHeight)+"px;'></div>");
 }
 	 else
 {
 comp = true;
 document.write("<div id='map' style='width:"+(myWidth/2.1)+"px;height:"+(myHeight/2.1)+"px;'></div>");
 }

 function search(start)
 {  
	 console.log("function search()");
 clearTimeout(timeout_id);

 sort_price = 'DESC';

 if (search_bool)
 {
	 
	 /*var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

	 start = (scrollTop-scrollTop%150)/150;*/
	 
 if (cana_min != 0 && cana_max != 0)
 {    console.log('search 0');
 console.log('http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&max='+cana_max+'&min='+cana_min+'&clientWidth='+myWidth+'&comp='+comp+'&sort_price='+sort_price);
 
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&max='+cana_max+'&min='+cana_min+
		 '&clientWidth='+myWidth+'&comp='+comp+'&sort_price='+sort_price+'&start='+start );
 }
 else
 if (cana_min != 0)
 {    console.log('search 1');
 
 console.log('http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&min='+cana_min+'&clientWidth='+myWidth+'&comp='+comp+'&sort_price='+sort_price);
 
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&min='+cana_min+'&clientWidth='+myWidth+
		 '&comp='+comp+'&sort_price='+sort_price+'&start='+start);
 }
 else
 if (cana_max != 0)
 {    console.log('search 2');
 
 console.log('http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&max='+cana_max+'&clientWidth='+myWidth+'&comp='+comp+'&sort_price='+sort_price);
		 
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&max='+cana_max+'&clientWidth='+myWidth+
		 '&comp='+comp+'&sort_price='+sort_price+'&start='+start);
 }
 else
 {	console.log('search 3');
 
 console.log('http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&clientWidth='+myWidth+'&comp='+comp+'&sort_price='+sort_price);
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search&search='+search_text+'&clientWidth='+myWidth+
		 '&comp='+comp+'&sort_price='+sort_price+'&start='+start);
 }
 
 http.onreadystatechange =  search_resp;
 http.send(null);
 }
 }
 
 
 function search_categories()
 {			console.log("function search_categories()");	
 search_bool = false;
 clearTimeout(timeout_id);
  if (cana_min != 0 && cana_max != 0)
 {    console.log('search 0');
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search_categories&search='+search_text+'&tip='+actual_tip+'&max='+cana_max+'&min='+cana_min+'&clientWidth='+myWidth+'&comp='+comp);
 }
 else
 if (cana_min != 0)
 {    console.log('search 1');
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search_categories&search='+search_text+'&tip='+actual_tip+'&min='+cana_min+'&clientWidth='+myWidth+'&comp='+comp);
 }
 else
 if (cana_max != 0)
 {    console.log('search 2');
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search_categories&search='+search_text+'&tip='+actual_tip+'&max='+cana_max+'&clientWidth='+myWidth+'&comp='+comp);
 }
 else
 {
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=search_categories&search='+search_text+'&tip='+actual_tip+'&clientWidth='+myWidth+'&comp='+comp);
 }
 http.onreadystatechange =  search_resp;
 http.send(null);
 }

 function search_resp()
 {								console.log("function search_resp()");
 	if(http.readyState == 4)
 	{
 	    resp = http.responseText;     console.log(resp);
 	   	if (arr_resp.length == 0) {
 	   		document.getElementById('search').innerHTML = 'Ничего не найдено!';
 	   		return;
 	   	}
 	    arr_resp  = resp.split('@');
 	     
 		document.getElementById('search').innerHTML = arr_resp[0];

 		document.getElementById('searchLike').style.display = 'none';
 		/*eval(arr_resp[1]);


 		 		len = document.getElementsByClassName('leaflet-shadow-pane')[0].childNodes.length-1;
                  for (;len >= 0; len--)
                  {
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].id = len;
                  document.getElementsByClassName('leaflet-marker-pane')[0].childNodes[len].onmousedown = function()
                  		{
 		                 prev_act_s.setAttribute('style', 'background-color:white;');
 		                 document.getElementById('a'+this.id).setAttribute('style', 'background-color:red;');
 		                 prev_act_s = document.getElementById('a'+this.id);
 		                 };
                  }*/
                  console.log(document.getElementById('t1'));
                  resize_table('search', 't1', 200);
                  console.log('offsetHeight'+document.getElementById('t1').offsetHeight+ ' offsetTop'+document.getElementById('t1').offsetTop);
                  document.getElementById('search').style.height = (document.getElementById('t1').offsetHeight- -document.getElementById('t1').offsetTop) + 'px';
 		console.log(document.getElementById('search').style.height+ ' ' + document.getElementById('t1').getElementsByTagName('TD').length);

 	}
 }


 //}


 function searchLike( text)
 {
	 console.log("function searchLike("+text+")");
 http.open('get', 'http://localhost:8159/Eximer/Controller?command=like&search='+text);
 http.onreadystatechange =  searchLike_resp;
 http.send(null);
 timeout_id = window.setTimeout("search(1)", 10000);
 search_text = text;
 search_bool = true;
 }


 function searchLike_resp()
 {									
 	if(http.readyState == 4)
 	{									
 	    resp = http.responseText;
 	    arr_resp  = resp.split('@');			console.log("function searchLike_resp "+resp);
 	    document.getElementById('searchLike').innerHTML = "";

 	    start_tr_like = 0;
 	    len_like = arr_resp.length;

 	    for (i = 0; i < arr_resp.length; i++)
 	    {
 	      	tr = document.createElement('tr');
 	      	td = document.createElement('td');
 	      	tr.appendChild(td);
 	      	document.getElementById('searchLike').appendChild(tr);
 	      	td.innerHTML = arr_resp[i];
 	      	tr.onmousedown = function()
 		    {
 		    	active_like.style.backgroundColor = '#ffffff';
 		    	this.style.backgroundColor = '#ff00ff';
 		    	active_like = this;
 		    	start_tr = this.id_por;
 		    }
     		tr.id_por = i;

 	      	tr.setAttribute('style', '');
 	      	if (i == 0)
 	      	{
 	      		 tr.style.backgroundColor = '#ff00ff';
 	      		 active_like = tr;
 	      	}
 	    }
 		document.getElementById('searchLike').style.display = 'block';
 	}
 }

 
 function in_basket(product_id, text)
 {	console.log('http://localhost:8159/Eximer/Controller?command=in_basket&product_id='+product_id+'&text='+text);
	 http.open('get', 'http://localhost:8159/Eximer/Controller?command=in_basket&product_id='+product_id+'&text='+text);
	 http.onreadystatechange =  success_resp;
	 http.send(null);
 }

 function in_bookmarks(product_id, radius)
 {	console.log('http://localhost:8159/Eximer/Controller?command=in_bookmarks&product_id='+product_id+'&radius='+radius);
	 http.open('get', 'http://localhost:8159/Eximer/Controller?command=in_bookmarks&product_id='+product_id+'&radius='+radius);
	 http.onreadystatechange =  success_resp;
	 http.send(null);
 }
 
 function success_resp()
 {									
 	if(http.readyState == 4)
 	{		
 		console.log("success_resp"+http.responseText);
 	    resp = http.responseText;
 	    console.log(resp);
 	}
 }	
 
</script>  