<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
  	<% request.setCharacterEncoding("UTF-8"); %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,600,700" rel="stylesheet" />
    <link href="../css/Search.css" rel="stylesheet" />
    
<script type="text/javascript"> 
//<![CDATA[
function calcHeight(){
 //find the height of the internal page

 var the_height=
 document.getElementById('the_iframe').contentWindow.
 document.body.scrollHeight;

 //change the height of the iframe
 document.getElementById('the_iframe').height=
 the_height;

 //document.getElementById('the_iframe').scrolling = "no";
 document.getElementById('the_iframe').style.overflow = "hidden";
}
//
</script>
<script type="text/javascript">
 
        function iframeshow(){
            if($('#the_iframe').css('display') == 'none'){
            $('#the_iframe').show();
        }else{
            $('#the_iframe').show();
        }
        }
            
    
        
    </script>
  </head>
  <body>
  <jsp:include page="top.jsp" flush="false"/>
    <div class="s009">
      <form action="SearchResult.jsp" method="post" target="list">
        <div class="inner-form">
          <div class="basic-search">
            <div class="input-field">
            
              <input name="keyword" type="text" placeholder="도서명 또는 저자명" />
              <div class="icon-wrap">
                <svg class="svg-inline--fa fa-search fa-w-16" fill="#ccc" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                  <path d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                </svg>
              </div>
            </div>
          </div>
          <div class="advance-search">
            <span class="desc">분류</span>
            <div class="row">
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="area">
                    <option placeholder="" value="선택안함">국내외분류</option>
                    <option value="국내">국내도서</option>
                    <option value="국외">국외도서</option>
                  </select>
                </div>
              </div>
              
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="category">
                  <option placeholder="" value="선택안함">도서분류</option>
                    <option value="층류">총류</option>
                    <option value="철학">철학</option>
                    <option value="종교">종교</option>
                    <option value="사회과학">사회과학</option>
                    <option value="자연과학">자연과학</option>
                    <option value="기술과학">기술과학</option>
                    <option value="예술">예술</option>
                    <option value="언어">언어</option>
                    <option value="문학">문학</option>
                    <option value="역사">역사</option>
                  </select>
                </div>
              </div>
              
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="newbook">
                    <option placeholder="" value="선택안함">신착자료검색</option>
                    <option value="전체">전체</option>
                    <option value="단행본">단행본</option>
                    <option value="비도서">비도서</option>
                  </select>
                </div>
              </div>
            <br><br><br>
            </div>
     
            <div class="row third">
              <div class="input-field">
                <div class="result-count">
                  Autobrary</div>
                <div class="group-btn">
                  <button class="btn-delete" id="delete" type="reset">RESET</button>
                  <button type="submit" class="btn-search" id="searchbtn" onclick="iframeshow()">SEARCH</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
    	<iframe id="the_iframe" onload="calcHeight();" name="list" title="도서검색결과" frameborder="0" scrolling="no" style="display:none; overflow-x:hidden; overflow:auto; width:100%;"></iframe>
    <script src="../js/extention/choices.js"></script>
    
    <script>
      const customSelects = document.querySelectorAll("select");
      const deleteBtn = document.getElementById('delete')
      const choices = new Choices('select',
      {
        searchEnabled: false,
        itemSelectText: '',
        removeItemButton: true,
      });
      deleteBtn.addEventListener("click", function(e)
      {
        e.preventDefault()
        const deleteAll = document.querySelectorAll('.choices__button')
        for (let i = 0; i < deleteAll.length; i++)
        {
          deleteAll[i].click();
        }
      });

    </script>
  </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
