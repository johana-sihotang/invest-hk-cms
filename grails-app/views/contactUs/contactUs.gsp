<html lang="en">
<head>
    <meta name="layout" content="main">
    <asset:stylesheet src="main.css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>

<body>
<!-- Contact US -->
<section class="contact_us">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-11">
                <div class="contactUs__section">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="contactForm__heading">
                                <h2 class="contactForm__heading--title">Contact Us</h2>

                                <p>Including the Hong Kong Head office, we have staff and representatives in 34 cities in Asia Pacific, Europe, Middle East, North and South America, and Africa.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact_us_office">
                    <div class="contactForm__heading">
                        <h2 class="contactForm__heading--title">InvestHK Head Office</h2>
                    </div>

                    <div class="contact_us_office">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="contactUs__office--item">
                                    <asset:image src="/favicon/map-pin.svg"
                                                 class="contactUs__office--icon"/>24/F, Fairmont House, 8 Cotton Tree Drive, Central, Hong Kong
                                </div>

                                <div class="contactUs__office--item">
                                    <asset:image src="favicon/phone-call.svg"
                                                 class="contactUs__office--icon"/>+852 3107 1000
                                </div>

                                <div class="contactUs__office--item">
                                    <asset:image src="/favicon/printer.svg"
                                                 class="contactUs__office--icon"/>+852 3107 9007
                                </div>

                                <div class="contactUs__office--item">
                                    <asset:image src="/favicon/mail2.svg"
                                                 class="contactUs__office--icon"/> enq@investhk.gov.hk
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="contactUs__office--item">
                                    <asset:image src="/favicon/clock.svg" class="contactUs__office--icon"/>
                                    8:45 a.m. - 12:30 p.m.<br>
                                    1:30 p.m. - 6:00 p.m.<br>
                                    Monday to Friday<br>
                                    (Closed on Saturday, Sunday and public holidays)
                                </div>

                                <div class="contactUs__office--item">
                                    <asset:image src="/favicon/command.svg" class="contactUs__office--icon"/>
                                    <strong>Areas of Responsibility:</strong> Hong Kong, All
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contactUs__section" data-select2-id="select2-data-13-v11r">
                    <div class="contactForm__heading">
                        <h2 class="contactForm__heading--title">InvestHK  Global Network</h2>
                    </div>

                    <div class="row">
                        <div class="col-lg-6" data-select2-id="select2-data-12-r5zl">
                            <div class="contactUs__network" data-select2-id="select2-data-11-o42o">
                                <g:render template="/components/input_selected" model="[
                                        label      : 'Continent',
                                        name       : 'continent',
                                        options    : continent,
                                        id         : 'continent-select',
                                        optionKey  : 'id',
                                        optionValue: 'name',
                                        labelClass : 'text-[#dc281e] font-bold',
                                        selectClass: 'text-2xl/[150] w-full border-solid border-[1px] border-[#bbbdbe] p-3'
                                ]"/>

                            </div>
                        </div>

                        <div class="col-lg-6" data-select2-id="select2-data-24-rzpc">
                            <div class="contactUs__network js-network-location" data-select2-id="select2-data-23-d4da">
                                <g:render template="/components/input_selected" model="[
                                        label      : 'Location',
                                        name       : 'continent',
                                        options    : locations,
                                        id         : 'location-select',
                                        optionKey  : 'id',
                                        optionValue: 'name',
                                        labelClass : 'text-[#dc281e] font-bold',
                                        selectClass: 'text-2xl/[150] w-full border-solid border-[1px] border-[#bbbdbe] p-3'
                                ]"/>
                            </div>
                        </div>
                    </div>
                </div>
                <g:render template="/components/contact_us"/>
            </div>
        </div>
    </div>
</section>

</body>
</html>