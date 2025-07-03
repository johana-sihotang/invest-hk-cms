<div class =container>
    <div class="flex-item">
        <div class="borderinfo ">
            <div class="heroSlider__content">
                <div class="heroSlider__content--body">
                    <div id="heroSliderContent__01" class="swiper js-hero-slider-content swiper-fade swiper-initialized swiper-horizontal swiper-watch-progress swiper-backface-hidden">
                        <div class="swiper-wrapper" id="swiper-wrapper-1de1f1fb9797c52b" aria-live="polite">
                            <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible swiper-slide-active" role="group" aria-label="1 / 4" style="width: 455px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
                                <div class="heroSlider__content--slide">
                                    <div class="heroSlider__content--category">News</div>
                                    <div class="heroSlider__content--date">11.03.2025</div>

                                    <h2 class="heroSlider__content--title">
                                        <a href="#">Mutat luptatum mnesarchum te nam, vix in postea graeco, duis accumsan ea pro. Te debet invidunt atomorum eum, no nec probo molestie verterem. Cu ius saperet luptatum facilisi. Zril verterem ei per, hinc tempor propriae duo id, mel vide officiis ne.</a>
                                    </h2>
                                </div>
                            </div>
                            <div class="swiper-slide swiper-slide-next" role="group" aria-label="2 / 4" style="width: 455px; opacity: 0; transform: translate3d(-455px, 0px, 0px);">
                                <div class="heroSlider__content--slide">
                                    <div class="heroSlider__content--category">Featured Case Studies</div>


                                    <h2 class="heroSlider__content--title"><a href="#">Fuelling Sustainable F&amp;B Packaging Solutions</a></h2>
                                    <div class="heroSlider__content--author">
                                        Cyril Drouet<br> Co-Founder and Managing Director, Choose Planet A
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide" role="group" aria-label="3 / 4" style="width: 455px; opacity: 0; transform: translate3d(-910px, 0px, 0px);">
                                <div class="heroSlider__content--slide">
                                    <div class="heroSlider__content--category">Featured Case Studies</div>


                                    <h2 class="heroSlider__content--title"><a href="#">Compelling Advertising Solutions on the Move</a></h2>
                                    <div class="heroSlider__content--author">
                                        Richard Petignaud<br> Managing Director, Bravo Media
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide" role="group" aria-label="4 / 4" style="width: 455px; opacity: 0; transform: translate3d(-1365px, 0px, 0px);">
                                <div class="heroSlider__content--slide">
                                    <div class="heroSlider__content--category">Featured Case Studies</div>


                                    <h2 class="heroSlider__content--title"><a href="#">Safeguarding Lives, Securing Business Operations</a></h2>
                                    <div class="heroSlider__content--author">
                                        Nicolas Sommer<br> Managing Director, Greater China International SOS
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="heroSlider__navigation d-flex">
                            <div id="heroSliderContent__01-dots" class="heroSlider__navigation--dots flex-fill align-self-center swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal"><span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1" aria-current="true"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></span></div>
                            <div class="heroSlider__navigation--action">
                                <button id="heroSliderContent__01-prev" type="button" class="heroSlider__navigation--action-button swiper-button-disabled" disabled="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-1de1f1fb9797c52b" aria-disabled="true">
                                    <i class="fa-solid fa-arrow-left" style="color: #ffffff;"></i>
                                </button>
                                <button id="heroSliderContent__01-next" type="button" class="heroSlider__navigation--action-button" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-1de1f1fb9797c52b" aria-disabled="false">
                                    <i class="fa-solid fa-arrow-right" style="color: #ffffff;"></i>
                                </button>
                            </div>
                        </div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                </div>
            </div>

        </div>
        <div class="borderimage">
            <div class="heroSlider__thumbnails--image" style="background-image: url(${assetPath(src: 'favicon/main_img01.jpg')});">
                <a href="#" class="heroSlider__thumbnails--link" aria-label="Pleas place your title here"></a>
                <div class="heroSlider__thumbnails--tags">
                    <a href="#" class="tag tag__blue">News</a>
                </div>
            </div>
        </div>
    </div>

</div>





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
                        <input type="text" name="searchNewsPress" class="input-control  input-control__icon" placeholder="Search News &amp; Press">
                        <span class="ihk-search input-icon"></span>

                    </div>
                </div>
            </div>
        </div>

        <button class="formFilter__filterAccordion collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne">
            <asset:image src="favicon/Filter_red.svg" alt="Filter Icon" width="24" height="24"/>
            Filters
        </button>

        <div class="formFilter__fieldButtom " id="collapseOne">
            <div class="formFilter__fieldButtom--row d-flex">
                <div class="formFilter__fieldButtom--left flex-fill">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="formFilter__fieldButtom--group">
                                <label class="label-field">Publication Date</label>
                                <select name="dateRange" class="form-select">
                                    <option value="" ${!params.dateRange ? 'selected' : ''}>All Dates</option>
                                    <option value="latest" ${params.dateRange == 'latest' ? 'selected' : ''}>Latest</option>
                                    <option value="past1month" ${params.dateRange == 'past1month' ? 'selected' : ''}>Past 1 Month</option>
                                    <option value="past1year" ${params.dateRange == 'past1year' ? 'selected' : ''}>Past 1 Year</option>
                                    <option value="past2year" ${params.dateRange == 'past2year' ? 'selected' : ''}>Past 2 Years</option>
                                </select>

                            </div>

                        </div>
                        <div class="col-lg-3">
                            <div class="formFilter__fieldButtom--group">
                                <label class="label-field">Content Type</label>
                                <g:select name="contentType"
                                          from="${contentTypes}"
                                          optionKey="id"
                                          optionValue="name"
                                          noSelection="['':'All Content Types']"
                                          value="${params.contentType}"/>

                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="formFilter__fieldButtom--group">
                                <label class="label-field">Location</label>
                                <g:select name="location"
                                          from="${locations}"
                                          optionKey="id"
                                          optionValue="name"
                                          noSelection="['':'All Locations']"
                                          value="${params.location}"/>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="formFilter__fieldButtom--group">
                                <label class="label-field">Industry</label>
                                <g:select name="industry"
                                          from="${industries}"
                                          optionKey="id"
                                          optionValue="name"
                                          noSelection="['':'All Industries']"
                                          value="${params.industry}"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="formFilter__fieldButtom--right">
                    <div class="text-end media-desktop">
                        <a href="#" class="textlink textlink__icon">
                            <span class="ihk-refresh"></span>
                            Reset Filters
                        </a>
                    </div>
                    <div class="formFilter__fieldButtom--action">
                        <button type="submit" class="button button__outline"><span>APPLY FILTERS</span></button>
                    </div>
                    <div class="text-center media-not-desktop">
                        <a href="#" class="textlink textlink__icon" onclick="resetFilters(event)">
                            <span class="ihk-refresh"></span>
                            Reset Filters
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</g:form>
<asset:javascript src="reset_filter.js"/>