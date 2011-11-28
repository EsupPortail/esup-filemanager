<%--

    Copyright (C) 2011 Esup Portail http://www.esup-portail.org
    Copyright (C) 2011 UNR RUNN http://www.unr-runn.fr
    Copyright (C) 2011 RECIA http://www.recia.fr
    @Author (C) 2011 Vincent Bonamy <Vincent.Bonamy@univ-rouen.fr>
    @Contributor (C) 2011 Jean-Pierre Tran <Jean-Pierre.Tran@univ-rouen.fr>
    @Contributor (C) 2011 Julien Marchal <Julien.Marchal@univ-nancy2.fr>
    @Contributor (C) 2011 Julien Gribonvald <Julien.Gribonvald@recia.fr>
    @Contributor (C) 2011 David Clarke <david.clarke@anu.edu.au>
    @Contributor (C) 2011 BULL http://www.bull.fr

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>


<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <h3 class="ui-widget-header ui-corner-all" ><spring:message code="details.header"/></h3>

  <div id="jquery_jplayer_1" class="jp-jplayer"></div>
  <div class="jp-audio">
    <div class="jp-type-single">
      <div id="jp_interface_1" class="jp-interface">
        <ul class="jp-controls">
          <li>
            <a href="#" class="jp-play" tabindex="1">play</a>
          </li>
          <li>
            <a href="#" class="jp-pause" tabindex="1">pause</a>
          </li>
          <li>
            <a href="#" class="jp-stop" tabindex="1">stop</a>
          </li>
          <li>
            <a href="#" class="jp-mute" tabindex="1">mute</a>
          </li>
          <li>
            <a href="#" class="jp-unmute" tabindex="1">unmute</a>
          </li>
        </ul>
        <div class="jp-progress">
          <div class="jp-seek-bar">
            <div class="jp-play-bar"></div>
          </div>
        </div>
        <div class="jp-volume-bar">
          <div class="jp-volume-bar-value"></div>
        </div>
        <div class="jp-current-time"></div>
        <div class="jp-duration"></div>
      </div>
      <div id="jp_playlist_1" class="jp-playlist">
        <ul>
          <li>${file.title}</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="details-spacer"></div>
<div class="details-attribute-header"><spring:message code="details.title" /> : </div>
<div class="details-attribute"><img src="${file.icon}" alt="icon" /> ${file.title}</div>

<div class="details-attribute-header"><spring:message code="details.size" /> : </div>
<div class="details-attribute">
  ${file.formattedSize.size}
  <spring:message code="details.${file.formattedSize.unit}" />
</div>
<div class="details-attribute-header"><spring:message code="details.type" /> : </div>
<div class="details-attribute">${file.mimeType}</div>
<div class="details-attribute-header"><spring:message code="details.lastModifiedTime" /> : </div>
<div class="details-attribute">${file.lastModifiedTime}</div>

<div class="details-spacer"></div>




    <form:form method="post" id="detailsFileForm">

      <input name="sharedSessionId" type="hidden" />

      <input name="dir" type="hidden" value="${file.encPath}" />


      <div id="detail-download">
          <spring:message code="details.download" />
      </div>


    </form:form>




<script type="text/javascript">

( function($) {

$(document).ready(function () {

  <c:if test="${not file.overSizeLimit}">

  console.log("Doc ready details sound");

   $("#jquery_jplayer_1").jPlayer({
     solution:"flash" , //, html",
          ready: function () {
              console.log("ready js player div");
            $(this).jPlayer("setMedia", {
              mp3: "/esup-portlet-stockage/servlet-ajax/fetchSound?path=${file.encPath}&sharedSessionId=${sharedSessionId}"
            });
          },
          swfPath: "/esup-portlet-stockage/js",
          supplied: "mp3"
        });



   </c:if>


    $('#detail-download').bind('click', function () {


        $("#detailsFileForm").attr("action", '/esup-portlet-stockage/servlet-ajax/downloadFile');

        //Set the sharedSessionId in the hiddeninputfield
        $("#detailsFileForm.sharedSessionId").val(sharedSessionId);
        $("#detailsFileForm").submit();
        return true;
    });


} );

})(jQuery);

</script>