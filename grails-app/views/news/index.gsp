<%@ page import="investhkcms.News" %>

<div class =container>
    <div class="flex-item">
        <div class="borderinfo ">
            <div class="heroSlider__content">
                <div class="heroSlider__content--body">
                    <div id="heroSliderImage">
                        <g:if test="${newsSlider}">
                            <g:each in="${newsSlider}" var="item">
                                <div class="slider">
                                    <div class="heroSlider__thumbnails--image" style="background-image: url('${item.image}');">
                                        <a href="#" class="heroSlider__thumbnails--link" aria-label="Pleas place your title here"></a>
                                    </div>
                                </div>
                            </g:each>
                        </g:if>
                        <g:else>
                            <div class="slider">
                                <div class="heroSlider__thumbnails--image" style="background-image: url(${assetPath(src: 'favicon/main_img01.jpg')});">
                                    <a href="#" class="heroSlider__thumbnails--link" aria-label="Pleas place your title here"></a>
                                </div>
                            </div>
                            <div class="slider">
                                <div class="heroSlider__thumbnails--image" style="background-image: url(${assetPath(src: 'favicon/main_img01.jpg')});">
                                    <a href="#" class="heroSlider__thumbnails--link" aria-label="Pleas place your title here"></a>
                                </div>
                            </div>
                        </g:else>
                    </div>
                    <div class="heroSlider__content__inner">
                        <div id="heroSliderContent">
                            <g:if test="${newsSlider}">
                                <g:each in="${newsSlider}" var="item">
                                    <div class="slider">
                                        <div class="heroSlider__content--slide">
                                            <div class="heroSlider__content--category">News</div>
                                            <h2 class="heroSlider__content--title">
                                                <g:link controller="news" action="show" id="${item.id}">${item.title}</g:link>
                                            </h2>
                                        </div>
                                    </div>
                                </g:each>
                            </g:if>
                            <g:else>
                                <div class="slider">
                                    <div class="heroSlider__content--slide">
                                        <div class="heroSlider__content--category">News</div>
                                        <div class="heroSlider__content--date">11.03.2025</div>
                                        <h2 class="heroSlider__content--title">
                                            <a href="#">Mutat luptatum mnesarchum te nam, vix in postea graeco, duis accumsan ea pro. Te debet invidunt atomorum eum, no nec probo molestie verterem. Cu ius saperet luptatum facilisi. Zril verterem ei per, hinc tempor propriae duo id, mel vide officiis ne.</a>
                                        </h2>
                                    </div>
                                </div>
                                <div class="slider">
                                    <div class="heroSlider__content--slide">
                                        <div class="heroSlider__content--category">Featured Case Studies</div>
                                        <h2 class="heroSlider__content--title"><a href="#">Fuelling Sustainable F&amp;B Packaging Solutions</a></h2>
                                    </div>
                                </div>
                                <div class="slider">
                                    <div class="heroSlider__content--slide">
                                        <div class="heroSlider__content--category">Featured Case Studies</div>
                                        <h2 class="heroSlider__content--title"><a href="#">Safeguarding Lives, Securing Business Operations</a></h2>
                                    </div>
                                </div>
                            </g:else>
                        </div>
                        <div class="heroSlider__navigation">
                            <div class="heroSlider__navigation--dots"></div>
                            <div class="heroSlider__navigation--action">
                                <button id="heroSliderContent__01-prev" type="button" class="heroSlider__navigation--action-button" aria-label="Previous slide">
                                    <i class="bi bi-arrow-left-circle"></i>
                                </button>
                                <button id="heroSliderContent__01-next" type="button" class="heroSlider__navigation--action-button" aria-label="Next slide">
                                    <i class="bi bi-arrow-right-circle"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!--Show All News and Filter-->
<g:form controller="news" action="index" method="GET">
    <section class="formFilter formFilter__white">
        <div class="container_">
            <div class="formFilter__fieldTop">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-6">
                        <div class="formFilter__heading">
                            <h2 class="formFilter__heading--title">ALL NEWS</h2>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="input-wrapper">
                            <input type="text" name="search" id="search" value="${params.search ?: ''}"
                                   class="input-control  input-control__icon " placeholder="Search News & Press">
                        </div>
                    </div>
                </div>
            </div>

            <button class="formFilter__filterAccordion collapsed" data-bs-toggle="collapse"
                    data-bs-target="#collapseOne">
                <asset:image src="favicon/Filter_red.svg" alt="Filter Icon" width="24" height="24"/>
                Filters
            </button>

            <div class="formFilter__fieldButtom " id="collapseOne">
                <div class="formFilter__fieldButtom--row d-flex">
                    <div class="formFilter__fieldButtom--left flex-fill">
                        <div class="row mobile-row">
                            <div class="col-lg-3">
                                <div class="text-xl">
                                    <label class="label-field">Publication Date</label>
                                </div>

                                <div class="border-2 border-solid text-xl">
                                    <div class="custom-dropdown publicationDate">
                                        <select name="dateRange" class="form-select">
                                            <option value="" ${!params.dateRange ? 'selected' : ''}>All Dates</option>
                                            <option value="last7days" ${params.dateRange == 'last7days' ? 'selected' : ''}>Last 7 Days</option>
                                            <option value="last1month" ${params.dateRange == 'past1month' ? 'selected' : ''}>Past 1 Month</option>
                                            <option value="last1year" ${params.dateRange == 'past1year' ? 'selected' : ''}>Past 1 Year</option>
                                            <option value="last2year" ${params.dateRange == 'past2years' ? 'selected' : ''}>Past 2 Year</option>
                                        </select>

                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3">
                                <div class="text-xl">
                                    <label class="label-field">Content Type</label>
                                </div>

                                <div class="border-2 border-solid text-small">
                                    <div class="custom-dropdown contentType ">
                                        <g:select name="contentType" class="form-select"
                                                  from="${contentTypes}"
                                                  optionKey="name"
                                                  optionValue="name"
                                                  noSelection="['': 'All Content Types']"
                                                  value="${params.contentType}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="text-xl">
                                    <label class="label-field">Location</label>
                                </div>

                                <div class="border-2 border-solid text-xl ">
                                    <div class="custom-dropdown location ">
                                        <g:select name="location" class="form-select"
                                                  from="${locations}"
                                                  optionKey="name"
                                                  optionValue="name"
                                                  noSelection="['': 'All location']"
                                                  value="${params.location}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="text-xl">
                                    <label class="label-field">Industry</label>
                                </div>

                                <div class="border-2 border-solid text-xl">
                                    <div class="custom-dropdown industry">
                                        <g:select name="industry" class="form-select"
                                                  from="${industries}"
                                                  optionKey="name"
                                                  optionValue="name"
                                                  noSelection="['': 'All Industries']"
                                                  value="${params.industry}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="formFilter__fieldButtom--right">
                                <div class="text-end media-desktop">
                                    <g:link controller="news" action="index" class="textlink textlink__icon">
                                        <span class="ihk-refresh"></span>
                                        Reset Filters
                                    </g:link>
                                </div>

                                <div class="formFilter__fieldButtom--action">
                                    <button type="submit" class="button button__outline"><span>APPLY FILTERS</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </section>
</g:form>

<section class="newsListing container">
    <div class="row newsListing__cardList">
        <g:if test="${news}">
            <g:each in="${news}" var="items">
                <div class="col-lg-4 col-md-6">
                    <div class="cardNews">
                        <div class="cardNews__thumbnail" style="background-image: url('${items.image}');">
                            <g:link controller="news" action="show" id="${items.id}">
                                <span class="cardNews__thumbnail--link"
                                      aria-label="${items.title.encodeAsHTML()}"></span>
                            </g:link>
                        </div>

                        <div class="cardNews__content">
                            <div class="cardNews__info">
                                <div class="cardNews__date">
                                    <g:formatDate date="${items.publicationDate}" format="dd.MM.yyyy"/></div>

                                <div class="cardNews__tags">
                                    <g:if test="${items.contentType?.name == 'News'}">
                                        <g:link controller="news" action="show" id="${items.id}"
                                                class="tag tag__blue">${items.contentType?.name?.toUpperCase()}</g:link>
                                    </g:if>
                                    <g:if test="${items.contentType?.name == 'Press Release'}">
                                        <g:link controller="news" action="show" id="${items.id}"
                                                class="tag tag__red">${items.contentType?.name?.toUpperCase()}</g:link>
                                    </g:if>
                                    <g:if test="${items.contentType?.name == 'Industry Insight'}">
                                        <g:link controller="news" action="show" id="${items.id}"
                                                class="tag tag__yellow">${items.contentType?.name?.toUpperCase()}</g:link>
                                    </g:if>
                                </div>
                            </div>
                            <h4 class="cardNews__title"><g:link controller="news" action="show"
                                                                id="${items.id}">${items.title.encodeAsHTML()}</g:link></h4>
                        </div>
                    </div>
                </div>

            </g:each>
        </g:if>
        <g:else>
            <div class="no-data">
                <p>No data</p>
            </div>
        </g:else>
    </div>
</section>
<g:render template="/components/pagination"/>

<div class="mb-10">
    <section class="contact_us">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-11">
                    <g:render template="/components/contact_us"/>
                </div>
            </div>
        </div>
    </section>
</div>