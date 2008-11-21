<%@ page pageEncoding="koi8-r" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"  %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="ru.org.linux.site.LorDataSource" %>
<jsp:include page="WEB-INF/jsp/head.jsp"/>

<title>� �������</title>
<jsp:include page="WEB-INF/jsp/header.jsp"/>
<div class=text>

<h1>� �������</h1>
�������������� ������ <i>LINUX.ORG.RU: ������� ���������� �� �� Linux</i> ��� 
������� � ������� 
1998 ����. ����� ����� �������� �������� ��������� ��������������� ������� � 
������������ ������� Linux � ������. �� ��������� ���������� �����������
������ ��������� Linux-��������������� �����������, ���������� ���������,
��������, ������������� � ������� ���������.

<h1>���� ��������</h1>
�� ������ ������������ ��� ������ ��� ������ �� ��� ����:<br>
<img width=88 height=31 src="/img/button.gif">
  <p>
  � ���� ������:<br>
  <img src="/img/linux-banner5.gif" alt="www.linux.org.ru" width="468" height="60"> 
  </p>

<h1>�������</h1>
���������� ������� � ����������� � ���� �������� �������������� ��������� 
��� "<a href="http://www.ratel.ru">����-��������</a>".
<p>
	���������� ������� ����� ���������� ���: <a href="http://linuxhacker.ru/stats">����������</a>.

<h1>����</h1>
  <p>
�� �������� ��:
    <ul>
      <li>Fedora 8</li>
      <li>���� PostgreSQL 8.2</li>
      <li>Apache2 2.2</li>
      <li>Sun Java SDK 1.6</li>
      <li>Apache Tomcat 5.5</li>
      <li>memcached 1.2</li>
    </ul>
  </p>

<h1>���� �������</h1>
������ ���������� � ����������� ������������� � ��������� ����� �������. 
<ul>
<li><a href="whois.jsp?nick=maxcom">������ ���������</a> (maxcom) - <i>�����������
�������</i> -
����������, ���������, ������, �������, �������������� ����������.

<li><a href="whois.jsp?nick=green">���� ������</a> (green) - ����������������� �������, ������
</ul>
  ����������:
  <ul>
<%
  Connection db = null;

  try {
    db = LorDataSource.getConnection();

    Statement st = db.createStatement();
    ResultSet rs = st.executeQuery("SELECT nick, name FROM users WHERE canmod ORDER BY id");

    while (rs.next()) {
      String nick = rs.getString("nick");
      String name = rs.getString("name");

      if ("maxcom".equals(nick)) {
        continue;    
      }

      out.print("<li><a href=\"whois.jsp?nick="+URLEncoder.encode(nick)+"\">"+name+"</a> ("+nick+ ')');
    }
%>

</ul>

  ���������� ��������:
  <ul>
<%
  ResultSet rs2 = st.executeQuery("SELECT nick, name FROM users WHERE corrector ORDER BY id");

  while (rs2.next()) {
    String nick = rs2.getString("nick");
    String name = rs2.getString("name");

    if ("maxcom".equals(nick)) {
      continue;
    }

    out.print("<li><a href=\"whois.jsp?nick="+URLEncoder.encode(nick)+"\">"+name+"</a> ("+nick+ ')');
  }

%>
  </ul>
  <%
  } finally {
    if (db!=null) {
      db.close();
    }
  }
  %>
</div>

<h1>������� �� �����</h1>
<p>
Linux.org.ru �������������� ������, �� �� ���������� ����������� ������� �� ���������� �����
����� ��������, ������������ ��� ������ �����. �� ������ ���������� ������� ����� Google Adsense
�� ���������� ������ ����� �� ������ "<a href="https://adwords.google.com/select/OnsiteSignupLandingPage?client=ca-pub-6069094673001350&referringUrl=http://www.linux.org.ru/">���������� ������� �� ���� �����</a>".
</p>
<h1>��������� �������</h1>
<ul>
  <li><a href="http://www.lorquotes.ru/">LorQuotes</a> - ��������� ������</li>
  <li><a href="http://www.lastfm.ru/group/Linux-org-ru">������ linux.org.ru �� last.fm</a></li>
  <li><a href="http://community.livejournal.com/l_o_r/">������ l.o.r. � ��</a></li>
</ul>

<jsp:include page="WEB-INF/jsp/footer.jsp"/>
