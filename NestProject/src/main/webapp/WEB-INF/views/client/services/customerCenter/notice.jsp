<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<title>공지사항 </title>
<body>
<c:import url="../common/customer_navi.jsp"/>
    <!----------->
    <div id="centerbtn">
        <p style="text-align: left; font-size: 12px;">고객센터 &nbsp; > &nbsp; 공지사항<p>
                <!--사이트 맵-->
                <h4 style="text-align: center; margin-top: 50px;">공지사항</h4>
             


    </div>


    <!----------공지사항 테이블------->
    <div style="margin: 0 auto; width: 1200px;">

        <div style="padding: 50px 0px; height: 600px; overflow-y: scroll;">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col-md-1">No</th>
                        <th scope="col-md-7">제목</th>
                        <th scope="col-md-2">날짜</th>
                        <th scope="col-md-2">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>네스트 공지사항입니다.</td>
                        <td>2019/00/00</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>네스트 공지사항입니다.</td>
                        <td>2019/00/00</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>네스트 공지사항입니다.</td>
                        <td>2019/00/00</td>
                        <td>10</td>
                    </tr>
 
                </tbody>
            </table>
        </div>
    </div>
    <!------footer-->
    <footer>
        <div id="footer" class="container_">


            <p id="text"><br>ⓒ 2019 Nest Corporation All rights reserved</p>
        </div>

    </footer>
</body>

</html>