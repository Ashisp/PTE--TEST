<%-- 
    Document   : disable_browser_cache
    Created on : Dec 30, 2015, 9:49:20 PM
    Author     : Nikesh Maharjan
--%>

<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility*/
%>
