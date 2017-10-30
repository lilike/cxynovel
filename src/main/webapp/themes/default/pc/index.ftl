<#include "common.ftl"/>

<#macro titleContent>  
<title>${labelSystemTitle}</title>
<meta name="keywords" content="${labelSystemSiteKeywords}"/>
<meta name="description" content="${labelSystemSiteDescription}" />
</#macro>  

<#macro recommendblock articleList id style> 
<ul class="seeWell cf" id="${id}" style="${style}">
    <#list articleList as book>
    <li>
       <a href=""  title="${book.bookName}" class="l mr10">
           <img src="${contextPath}/${book.address}" style="width: 120px; height: 150px" alt="${book.bookName}"/></a>
       <img src="${contextPath}/themes/default/pc/images/only.png" alt="完本图标" class="topss png_bg"><img src="${contextPath}/themes/default/pc/images/only2.png" class="topss png_bg" alt="连载中图标">
       <span class="l">
          <a href="${book.address}"  title="${book.bookName}" class="clearfix stitle">${book.bookName}</a>
          作者：<a href="${book.bookAuthor}">${book.bookAuthor}</a>
          <em class="c999 clearfix">${book.intro}</em>
          更新：<a href="${book.lastChapter}"  title="${book.lastChapter}">${book.lastChapter}</a>
          <a href="${book.address}${book.chapters}" class="readTo"  title="${book.bookName}">马上阅读</a>
       </span>
    </li>
    </#list>
</ul>
</#macro>

<#macro lastupdateblock articleList> 
<section class="box" id="news">
    <h2>刚刚更新的：</h2>
    <ol>
        <#list articleList as book>
            <li>
                <em class="r">${book.lastChapter}</em>
                <a href="/bookList?category=${book.category}&page=1" title = "${book.category}" >${book.category}</a>
                <a class="poptext" href="${book.address}"
                    title="${book.bookName}最新章节" class="f14">${book.bookName}</a>
                <a class="poptext" href="${book.lastChapter}" >${book.lastChapter}</a>
                作者：<a class="poptext" href="${book.address}" title="${book.bookAuthor}的小说" class="f14">${book.bookAuthor}</a>
            </li>
        </#list>
    </ol>
</section>
</#macro>

<#macro lastinsertblock articleList> 
<section class="box" id="sorts">
    <h2>最新入库小说：</h2>
    <ol>
        <#list articleList as book>
        <li class="top3">
            <span class="order">${book.id+1}</span>
            <span class="chapter"><a href="/articleList?category=${book.category}" title="${book.category}" target="_blank">${book.category}</a></span>
            <a target="_blank" href="${book.address}" title="${book.bookName}最新章节">${book.bookName}</a> 
            <span class="chapter"><a href="${book.address}" title="${book.lastChapter}">${book.lastChapter}</a></span>
        </li>
        </#list>
    </ol>
</section>
</#macro>


<#macro content>
   <div id="index_ad_01"></div>
   <p class="b-all-switch normal">好看的:
      <a href="javascript:;" class="select" id="ask1" onMouseOver="repales_rell(1,5)">都市言情</a>
      <a href="javascript:;" id="ask2" onMouseOver="repales_rell(2,5)">玄幻魔法</a>
      <a href="javascript:;" id="ask3" onMouseOver="repales_rell(3,5)">历史军事</a>
      <a href="javascript:;" id="ask4" onMouseOver="repales_rell(4,5)">恐怖灵异</a>
      <a href="javascript:;" id="ask5" onMouseOver="repales_rell(5,5)">武侠修真</a>
   </p>
	
	   <#if recommendblock?exists>
          <@recommendblock articleList=blocks.index_yanqing_tuijian.index_yanqing_tuijian id="cttd1" style=""/> 
	    </#if>
	    <#if recommendblock?exists>
	          <@recommendblock articleList=blocks.index_xuanhuan_tuijian.index_xuanhuan_tuijian id="cttd2" style="display:none;"/>
	    </#if>
	    <#if recommendblock?exists>
	          <@recommendblock articleList=blocks.index_junshi_tuijian.index_junshi_tuijian id="cttd3" style="display:none;"/>
	    </#if>
	    <#if recommendblock?exists>
	          <@recommendblock articleList=blocks.index_kongbu_tuijian.index_kongbu_tuijian id="cttd4" style="display:none;"/>
	    </#if>
	    <#if recommendblock?exists>
	          <@recommendblock articleList=blocks.index_wuxia_tuijian.index_wuxia_tuijian id="cttd5" style="display:none;"/>
	    </#if>

    <div id="index_ad_02"></div>
    <div class="clear"></div>
    <div id="J_random_board" class="random-board cf board">
    	<#if lastupdateblock?exists>
          <@lastupdateblock articleList=blocks.last_update_list.last_update_list/>
        </#if>
        <#if lastinsertblock?exists>
          <@lastinsertblock articleList=blocks.last_insert_list.last_insert_list/>
        </#if>
    </div> 
    <div id="index_ad_03"></div>
    <div class="clear"></div>
    <p class="b-all-switch normal">友情链接:</p>
    <div class="mainLink">
            ${blocks.friend_link.content}
    </div>
</#macro>
