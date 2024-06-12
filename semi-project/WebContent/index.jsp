<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

	 <style>
        .header-image {
            background-image: url('/semi-project/img/img_main/head_main.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            text-align: center;
            padding: 50px 0; /* 헤더 영역의 여백을 설정할 수 있습니다 */
        }
    </style>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script> // JavaScript 라이브러리 중 하나 CDN을 통해서 라이브러리를 가져왔다.
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth', // 월별 달력으로 시작
            height: 500, 
            events: [ // 일정 데이터
                {
                    title: '토트넘 vs 맨유',
                    start: '2024-06-08'
                },
                {
                    title: '토트넘 vs 리버풀',
                    start: '2024-06-15'
                },
                {
                    title: '토트넘 vs 첼시',
                    start: '2024-06-22'
                },
                {
                    title: '토트넘 vs 아스날',
                    start: '2024-06-28'
                },
               
                {
                    title: '토트넘 vs 맨시티',
                    start: '2024-07-06'
                }
            ]
        });

        calendar.render();
    });
</script>

<style>
    body {
        background-image: url('/semi-project/img/img_main/main.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        text-align: center;
        margin-left: 50px;
        margin-top: 20px;
    }
    .calendar-container {
        max-width: 800px; 
        margin: 100 auto; 
    }
    
    .rank-table {
        position: fixed;
        top: 150px; 
        right: 80px; 
        padding: 4px;
        border-radius: 4px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }
    
    .rank-table th,
    .rank-table td {
        padding: 3px;
    }
    
    .rank-table th {
        background-color: #f2f2f2; /* 테이블 헤더 배경색 */
    }
    
    .rank-table .champions  {
        background-color: #6f8dd9;
    }
    
    .rank-table .europaLeague {
        background-color: #88c3ef; 
    }
     .rank-table .down {
        background-color: red; 
    }
    
    .state_desc .state1:before {
	    background-color: #6f8dd9;
	}
	.state_desc .state2:before {
    background-color: #88c3ef;
	}
	.state_desc .state4:before {
	    background-color: red;
	}
	
	.state_desc li:before {
    content: '';
    display: inline-block;
    width: 11px;
    height: 11px;
    margin: 1px 5px 0 0;
    vertical-align: top;
	}
	
	.state_desc ul {
    display: inline-block; /* ul 요소를 인라인 블록으로 설정하여 한 줄로 배치합니다 */
	
	}
	
	.state_desc li {
	    display: inline; /* 각 li 요소를 인라인으로 배치하여 한 줄에 표시합니다 */
	    margin-right: 20px; /* 각 li 요소 사이의 간격을 설정합니다 */
	}
	
	#footerarea {
    position: fixed;
    bottom: 0;
    width: 100%;
    color: grey; /* 텍스트 색상 설정 */
    padding: 10px; /* 하단 바 내부 여백 설정 */
    text-align: center; /* 텍스트를 가운데 정렬합니다. */
	}
    
</style>   

</head>
<body>
<div class="centered">	</div>			
<h3>토트넘 팬 홈페이지</h3>
<hr>
<a href="index.jsp" class="btn btn-outline-info btn-lg">메인 페이지</a>&nbsp;&nbsp;
<a href="memForm.t" class="btn btn-outline-success btn-lg">회원가입</a>&nbsp;&nbsp;
<a href="memSelectAll.t" class="btn btn-outline-success btn-lg">회원목록</a>&nbsp;&nbsp;
<a href="newsSelectAll.t" class="btn btn-outline-info btn-lg">뉴스게시판</a>&nbsp;&nbsp;
<a href="productSelectAll.t" class="btn btn-outline-info btn-lg">상품구입</a>&nbsp;&nbsp;
<a href="boardForm.t" class="btn btn-outline-info btn-lg">일반게시판</a>&nbsp;&nbsp;
<a href="boardSelectAll.t" class="btn btn-outline-info btn-lg">게시글목록</a>&nbsp;&nbsp;
<a href="" class="btn btn-outline-success btn-lg">로그인</a>
<br>
<br>
<div class="calendar-container">
    <div id='calendar'></div> <!-- 달력 표시 영역 -->
</div>

<div class="rank-table">
    <h2>팀 순위표</h2>
    <table border="1">
        <thead>
            <tr>
                <th>순위</th>
                <th>팀</th>
                <th>경기수</th>
                <th>승점</th>
                <th>승</th>
                <th>무</th>
                <th>패</th>
                <th>득점</th>
                <th>실점</th>
                <th>골득실</th>
            </tr>
        </thead>
        <tbody>
        	<tr>
            <td class="champions "><strong>1</strong></td>
                <td class="align_l">
                    <div class="inner">
                        <span class="name">맨체스터 시티 </span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>91</span></div></td>
                <td><div class="inner"><span>28</span></div></td>
                <td><div class="inner"><span>7</span></div></td>
                <td><div class="inner"><span>3</span></div></td>
                <td><div class="inner"><span>96</span></div></td>
                <td><div class="inner"><span>34</span></div></td>
                <td><div class="inner"><span>62</span></div></td>
            </tr>
            
            <tr>
            <td class="champions "> <strong>2</strong></td>              
                <td class="align_l">
                    <div class="inner">
                        <span class="name">아스널</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>89</span></div></td>
                <td><div class="inner"><span>28</span></div></td>
                <td><div class="inner"><span>5</span></div></td>
                <td><div class="inner"><span>5</span></div></td>
                <td><div class="inner"><span>91</span></div></td>
                <td><div class="inner"><span>29</span></div></td>
                <td><div class="inner"><span>62</span></div></td>
            </tr>
            
            <tr>
            <td class="champions "><strong>3</strong></td>                
                <td class="align_l">
                    <div class="inner">
                        <span class="name">리버풀</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>82</span></div></td>
                <td><div class="inner"><span>24</span></div></td>
                <td><div class="inner"><span>10</span></div></td>
                <td><div class="inner"><span>4</span></div></td>
                <td><div class="inner"><span>86</span></div></td>
                <td><div class="inner"><span>41</span></div></td>
                <td><div class="inner"><span>45</span></div></td>
            </tr>
            
            <tr>
            <td class="champions "> <strong>4</strong></td>              
                <td class="align_l">
                    <div class="inner">
                        <span class="name">에스턴빌라</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>68</span></div></td>
                <td><div class="inner"><span>20</span></div></td>
                <td><div class="inner"><span>8</span></div></td>
                <td><div class="inner"><span>10</span></div></td>
                <td><div class="inner"><span>76</span></div></td>
                <td><div class="inner"><span>61</span></div></td>
                <td><div class="inner"><span>15</span></div></td>
            </tr>
            
            <tr>
            <td class="europaLeague"><strong>5</strong></td>         
                <td class="align_l">
                    <div class="inner">
                        <span class="name">토트넘</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>66</span></div></td>
                <td><div class="inner"><span>20</span></div></td>
                <td><div class="inner"><span>6</span></div></td>
                <td><div class="inner"><span>12</span></div></td>
                <td><div class="inner"><span>74</span></div></td>
                <td><div class="inner"><span>61</span></div></td>
                <td><div class="inner"><span>13</span></div></td>
            </tr>
            
            <tr>
            <td class="num"><strong>6</strong></td>            
                <td class="align_l">
                    <div class="inner">
                        <span class="name">첼시</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>63</span></div></td>
                <td><div class="inner"><span>18</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>11</span></div></td>
                <td><div class="inner"><span>77</span></div></td>
                <td><div class="inner"><span>63</span></div></td>
                <td><div class="inner"><span>14</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>7</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">뉴캐슬</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>60</span></div></td>
                <td><div class="inner"><span>18</span></div></td>
                <td><div class="inner"><span>6</span></div></td>
                <td><div class="inner"><span>14</span></div></td>
                <td><div class="inner"><span>85</span></div></td>
                <td><div class="inner"><span>62</span></div></td>
                <td><div class="inner"><span>23</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>8</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">맨유</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>60</span></div></td>
                <td><div class="inner"><span>18</span></div></td>
                <td><div class="inner"><span>6</span></div></td>
                <td><div class="inner"><span>14</span></div></td>
                <td><div class="inner"><span>57</span></div></td>
                <td><div class="inner"><span>58</span></div></td>
                <td><div class="inner"><span>-1</span></div></td>
            </tr>
            
              <tr>
            <td class="num"> <strong>9</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">웨스트햄</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>52</span></div></td>
                <td><div class="inner"><span>14</span></div></td>
                <td><div class="inner"><span>10</span></div></td>
                <td><div class="inner"><span>14</span></div></td>
                <td><div class="inner"><span>60</span></div></td>
                <td><div class="inner"><span>74</span></div></td>
                <td><div class="inner"><span>-14</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>10</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">크리스탈 팰리스</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>49</span></div></td>
                <td><div class="inner"><span>13</span></div></td>
                <td><div class="inner"><span>10</span></div></td>
                <td><div class="inner"><span>15</span></div></td>
                <td><div class="inner"><span>57</span></div></td>
                <td><div class="inner"><span>58</span></div></td>
                <td><div class="inner"><span>-1</span></div></td>
            </tr>
            
                <tr>
            <td class="num"> <strong>11</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">브라이턴 앤 호브 알비온</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>48</span></div></td>
                <td><div class="inner"><span>12</span></div></td>
                <td><div class="inner"><span>12</span></div></td>
                <td><div class="inner"><span>14</span></div></td>
                <td><div class="inner"><span>55</span></div></td>
                <td><div class="inner"><span>62</span></div></td>
                <td><div class="inner"><span>-7</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>12</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">본머스</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>48</span></div></td>
                <td><div class="inner"><span>13</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>16</span></div></td>
                <td><div class="inner"><span>54</span></div></td>
                <td><div class="inner"><span>67</span></div></td>
                <td><div class="inner"><span>-13</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>13</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">풀럼</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>47</span></div></td>
                <td><div class="inner"><span>13</span></div></td>
                <td><div class="inner"><span>8</span></div></td>
                <td><div class="inner"><span>17</span></div></td>
                <td><div class="inner"><span>55</span></div></td>
                <td><div class="inner"><span>61</span></div></td>
                <td><div class="inner"><span>-6</span></div></td>
            </tr> 
            
            <tr>
            <td class="num"> <strong>14</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">울버햄튼</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>46</span></div></td>
                <td><div class="inner"><span>13</span></div></td>
                <td><div class="inner"><span>7</span></div></td>
                <td><div class="inner"><span>18</span></div></td>
                <td><div class="inner"><span>50</span></div></td>
                <td><div class="inner"><span>65</span></div></td>
                <td><div class="inner"><span>-15</span></div></td>
            </tr>
         
            <tr>
            <td class="num"> <strong>15</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">에버턴</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>40</span></div></td>
                <td><div class="inner"><span>13</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>16</span></div></td>
                <td><div class="inner"><span>40</span></div></td>
                <td><div class="inner"><span>51</span></div></td>
                <td><div class="inner"><span>-11</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>16</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">브렌트퍼트</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>49</span></div></td>
                <td><div class="inner"><span>10</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>19</span></div></td>
                <td><div class="inner"><span>56</span></div></td>
                <td><div class="inner"><span>65</span></div></td>
                <td><div class="inner"><span>-9</span></div></td>
            </tr>
            
            <tr>
            <td class="num"> <strong>17</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">노팅엄 포레스트</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>32</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>20</span></div></td>
                <td><div class="inner"><span>49</span></div></td>
                <td><div class="inner"><span>67</span></div></td>
                <td><div class="inner"><span>-18</span></div></td>
            </tr>
            
            <tr>
            <td class="down"> <strong>18</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">루턴 타운</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>26</span></div></td>
                <td><div class="inner"><span>6</span></div></td>
                <td><div class="inner"><span>8</span></div></td>
                <td><div class="inner"><span>24</span></div></td>
                <td><div class="inner"><span>52</span></div></td>
                <td><div class="inner"><span>85</span></div></td>
                <td><div class="inner"><span>-33</span></div></td>
            </tr>
            
            <tr>
            <td class="down"> <strong>19</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">번리FC</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>24</span></div></td>
                <td><div class="inner"><span>5</span></div></td>
                <td><div class="inner"><span>9</span></div></td>
                <td><div class="inner"><span>24</span></div></td>
                <td><div class="inner"><span>41</span></div></td>
                <td><div class="inner"><span>78</span></div></td>
                <td><div class="inner"><span>-37</span></div></td>
            </tr>
            
             <tr>
            <td class="down"> <strong>20</strong></td>             
                <td class="align_l">
                    <div class="inner">
                        <span class="name">셰필드 유나이티드</span>						
                    </div>
                </td>
                <td><div class="inner"><span>38</span></div></td>
                <td><div class="inner"><span>16</span></div></td>
                <td><div class="inner"><span>3</span></div></td>
                <td><div class="inner"><span>7</span></div></td>
                <td><div class="inner"><span>28</span></div></td>
                <td><div class="inner"><span>35</span></div></td>
                <td><div class="inner"><span>104</span></div></td>
                <td><div class="inner"><span>-69</span></div></td>
            </tr>
            
            <!-- 나머지 순위 행들 추가 -->
          
        </tbody>
    </table>
       <div class="state_desc">
				<ul>
					<li class="state1">챔피언스 리스 직행</li>
					<li class="state2">유로파 리그</li>
					<li class="state4">강등 직행</li>
				</ul>	
			</div>
</div>
	<footer id="footerarea" >
	<div class="wrapper">
		<div>
			<br> 제작자 : 손치원 안우성 장윤수
		</div>
	</div>
	</footer>


</body>


</html>
