<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 23/06/25
  Time: 21.44
--%>
<div class="container-layout">
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
                    <div class="article__tags__images">
                        <img src="${news.image}"/>
                    </div>

                    <div class="article__tags__caption">
                        <p>${news.imageCaption}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="article__container article__container--content">
            <h2 class="line-height-normal">${news.subTitle}</h2>

            <div class="slider">
                <div class="article__tags caption">
                    <img src="${news.image}"/>

                    <div class="slider__tags__caption">
                        <p>${news.imageCaption}</p>
                    </div>
                </div>
            </div>

            <div class="text-content">${raw(news.content)}</div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-11">
            <g:render template="/components/contact_us"/>
        </div>

    </div>

    <button id="scrollToTopBtn" class="scroll-to-top">
        <i class="fa-solid fa-arrow-up"></i>
    </button>
</div>

