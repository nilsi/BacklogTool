<!--
The MIT License

Copyright 2012 Sony Mobile Communications AB. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Backlog Tool - ${area.name}</title>
    <script type="text/javascript">
        var areaName = "${area.name}";
        var view = "${view}";
        var disableEditsBoolean = "${disableEdits}" == "true" ? true : false;
    </script>
    <link rel="shortcut icon" href="<c:url value="/resources/css/ui-lightness/images/favicon.ico" />"></link>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/ui-lightness/jquery-ui-1.10.3.custom.min.css" />"></link>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css?v=${versionNoDots}" />"></link>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery.dropdown.css" />"></link>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/fff-silk.min.css" />"></link>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.0.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.blockUI-2.61.0.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.autosize-min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/scripts.js?v=${versionNoDots}" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.truncator.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.dropdown.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.atmosphere-min.js" />"></script>
    
</head>
<body>
    <div id="wrap">
        <div id="header">
            <c:import url="header.jsp" />
        </div>
        <div id="main">
            <div id="story-placeholder" class="placeholder" >
                <c:set var="story" value="${placeholderStory}"/>
                <%@ include file="/WEB-INF/views/placeholders/story.jsp"%>
            </div>
            <div id="task-placeholder" class="placeholder" >
                <c:set var="task" value="${placeholderTask}"/>
                <%@ include file="/WEB-INF/views/placeholders/task.jsp"%>
            </div>

            <div id="list-container-div">
                <ul class="parent-child-list" id="list-container">
                    <c:forEach var="story" items="${nonArchivedStories}">
                        <c:if test="${filterIds == null || filterIds.contains(story.id)}">
                            <%@ include file="/WEB-INF/views/placeholders/story.jsp" %>
                            <c:forEach var="task" items="${story.children}">
                                <%@ include file="/WEB-INF/views/placeholders/task.jsp" %>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </ul>
                <ul class="parent-child-list" id="archived-list-container"></ul>
            </div>
        </div>

    </div>

    <div id="footer">
        <c:import url="footer.jsp" />
    </div>

    <c:import url="delete.jsp"></c:import>
</body>

</html>