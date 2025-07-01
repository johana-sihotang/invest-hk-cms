<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 26/06/2025
  Time: 11:54
--%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Admin News| Invest HK</title>
    <asset:stylesheet src="main.css"/>

</head>
<body>
<div class="article">
    <div class="article__container article__container--header">
        <div class="col-2">
            <div class="article__title">
                <div class="row-4">
                    <g:render template="/components/breadcrumb"/>
                    <h1>${news.title}</h1>

                    <div class="article__tags col-span-2">
                        <button class="tag tag-red">
                            <p>${news.industry}</p>
                        </button>
                        <button class="tag tag-black">
                            <p>${news.location}</p>
                        </button>

                        <p class="font-medium mt-30"><g:formatDate date="${news.publicationDate}"
                                                                   format="dd.MM.yyyy"/></p>
                    </div>
                    <i class="uil uil-share-alt icon-share"></i>
                </div>
            </div>

            <div class="article__tags caption">
                <img src="${news.image}"/>

                <p>${news.imageCaption}</p>
            </div>
        </div>
    </div>

    <div class="article__container article__container--content">
        <h2 class="line-height-normal">${news.subTitle}</h2>

        <div class="article__tags caption">
            <img src="${news.image}"/>

            <p>${news.imageCaption}</p>
        </div>

        <p class="text-medium line-height-normal font-red-100">${raw(news.content)}</p>
    </div>
</div>
<button id="scrollToTopBtn" class="scroll-to-top">
    <i class="fa-solid fa-arrow-up"></i>
</button>
</body>