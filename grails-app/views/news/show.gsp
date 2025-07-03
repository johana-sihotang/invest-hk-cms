<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 23/06/25
  Time: 21.44
--%>
<div class="article">
    <div class="article__container article__container--header">
        <div class="col-2">
            <div class="article__title">
                <div class="row-4">
                    <g:render template="/components/breadcrumb"/>
                    <h1>${news.title}</h1>

                    <div class="article__tags col-span-2">
                        %{--KONDISI JIKA TAG KOSONG  --}%
                        <button class="tag tag-blue">
                            <p>${news.contentType}</p>
                        </button>
                        <button class="tag tag-black">
                            <p>${news.location}</p>
                        </button>
                        <button class="tag tag-red">
                            <p>${news.industry}</p>
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
