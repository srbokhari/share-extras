<#-- This file is part of the Share Extras PdfJs Viewer project -->
<#assign el=args.htmlid?html>
    <div id="${el}-controls" class="controls">
      <button id="${el}-previous">
        <img src="${url.context}/res/components/images/back-arrow.png" align="top" height="16"/>
        ${msg("button.previous")}
      </button>

      <button id="${el}-next">
        <img src="${url.context}/res/components/images/forward-arrow-16.png" align="top" height="16"/>
        ${msg("button.next")}
      </button>

      <input type="number" id="${el}-pageNumber" value="1" size="4" min="1" />

      <span>/</span>
      <span id="${el}-numPages">--</span>

      <button id="${el}-zoomOut" title="${msg("button.zoomout")}">
        <img src="${url.context}/res/extras/components/preview/pdfjs/images/zoom-out.svg" align="top" height="16"/>
      </button>
      <button id="${el}-zoomIn" title="${msg("button.zoomin")}">
        <img src="${url.context}/res/extras/components/preview/pdfjs/images/zoom-in.svg" align="top" height="16"/>
      </button>

      <select id="${el}-scaleSelect">
        <option id="customScaleOption" value="custom"></option>
        <option value="0.25">25%</option>
        <option value="0.5">50%</option>
        <option value="0.75">75%</option>
        <option value="1">100%</option>
        <option value="1.25">125%</option>
        <option value="1.5">150%</option>
        <option value="2">200%</option>
        <option value="4">400%</option>
        <option id="pageWidthOption" value="page-width">${msg("select.pagewidth")}</option>
        <option id="pageFitOption" value="page-fit">${msg("select.pagefit")}</option>
        <option id="pageAutoOption" value="auto" selected="selected">${msg("select.auto")}</option>
      </select>

      <button id="${el}-download" title="${msg("button.download")}">
        <img src="${url.context}/res/components/documentlibrary/actions/document-download-16.png" align="top" height="16"/>
        ${msg("button.download")}
      </button>

      <button id="${el}-fullpage" title="${msg("button.fullpage")}">
        <img src="${url.context}/res/components/documentlibrary/actions/default-16.png" align="top" height="16"/>
        ${msg("button.fullpage")}
      </button>

    </div>
    <div id="${el}-errorWrapper" hidden='true'>
      <div id="${el}-errorMessageLeft">
        <span id="${el}-errorMessage"></span>
        <button id="${el}-errorShowMore" onclick="" oncontextmenu="return false;">
          ${msg("error.moreinformation")}
        </button>
        <button id="${el}-errorShowLess" onclick="" oncontextmenu="return false;" hidden='true'>
          ${msg("error.lessinformation")}
        </button>
      </div>
      <div id="${el}-errorMessageRight">
        <button id="${el}-errorClose" oncontextmenu="return false;">
          ${msg("error.close")}
        </button>
      </div>
      <div class="clearBoth"></div>
      <textarea id="${el}-errorMoreInfo" hidden='true' readonly="readonly"></textarea>
    </div>

    <div id="${el}-sidebar" class="sidebar">
      <div id="${el}-sidebarBox">
        <div id="${el}-pinIcon" onClick="PDFView.pinSidebar()"></div>
        <div id="${el}-sidebarScrollView">
          <div id="${el}-sidebarView"></div>
        </div>
        <div id="${el}-outlineScrollView" hidden='true'>
          <div id="${el}-outlineView"></div>
        </div>
        <div id="${el}-sidebarControls">
          <button id="${el}-thumbsSwitch" title="${msg("sidebar.showthumbnails")}" onclick="PDFView.switchSidebarView('thumbs')" data-selected>
            <img src="${url.context}/res/extras/components/preview/pdfjs/images/nav-thumbs.svg" align="top" height="16" alt="${msg("sidebar.showthumbnails.alt")}" />
          </button>
          <button id="${el}-outlineSwitch" title="${msg("sidebar.showoutline")}" onclick="PDFView.switchSidebarView('outline')" disabled>
            <img src="${url.context}/res/extras/components/preview/pdfjs/images/nav-outline.svg" align="top" height="16" alt="${msg("sidebar.showoutline.alt")}" />
          </button>
        </div>
      </div>
    </div>

    <div id="${el}-loadingBox" class="loadingBox">
        <div id="${el}-loading">${msg("loading")}... 0%</div>
        <div id="${el}-loadingBar"><div class="progress"></div></div>
    </div>
    <div id="${el}-viewer" class="viewer">
        <a name="${el}"></a>
    </div>