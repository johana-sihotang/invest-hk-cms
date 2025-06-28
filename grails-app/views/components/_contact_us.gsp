<div class="contactUs__form">
    <div class="contactForm__heading">
        <h2 class="contactForm__heading--title">Leave Your Details and We’ll Be In Touch</h2>
    </div>

    <g:form controller="contactUs" action="save">
        <div class="row">
            <div class="col-lg-6 contactForm__group">
                <label for="lastName" class="label-field">Last Name*</label>
                <div class="input-wrapper">
                    <input type="text" name="lastName" id="lastName" class="input-control " placeholder="Input"/>
                </div>
            </div>
            <div class="col-lg-6 contactForm__group">
                <label for="firstName" class="label-field">First Name*</label>
                <div class="input-wrapper">
                    <input type="text" name="firstName" id="firstName" class="input-control " placeholder="Input"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 contactForm__group">
                <label for="email" class="label-field">Email*</label>
                <div class="input-wrapper">
                    <input type="email" name="email" id="email" class="input-control " placeholder="Input"/>
                </div>
            </div>
            <div class="col-lg-6 contactForm__group">
                <label for="tel" class="label-field">Tel</label>
                <div class="input-wrapper">
                    <input type="number" name="tel" id="tel" class="input-control " placeholder="Input"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 contactForm__group">
                <label for="city" class="label-field">City</label>
                <div class="input-wrapper">
                    <input type="text" name="city" id="city" class="input-control " placeholder="City"/>
                </div>
            </div>
            <div class="col-lg-6 contactForm__group">
                <g:render template="/components/input_selected" model="[
                        label        : 'Location',
                        name         : 'locationId',
                        options      : locations,
                        optionKey    : 'id',
                        optionValue  : 'name',
                        selectedValue: contactUs?.location?.id,
                        labelClass   : 'text-[#dc281e] font-bold',
                        selectClass : 'text-2xl/[150] w-full border-solid border-[1px] border-[#bbbdbe] p-3'
                ]"/>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 contactForm__group">
                <label for="enquiry" class="label-field">Enquiry*</label>
                <div class="input-wrapper">
                    <textarea rows="6" name="enquiry" id="enquiry" class="input-control" placeholder="Enquiry"></textarea>
                </div>
            </div>
        </div>
        <div class="contactForm__remarks">
            The personal information you have provided will help us deliver, develop and promote our services. By submitting your details, ticking the boxes and clicking "Submit" indicate that you have read and agreed to our <a href="#">privacy policy and cookie policy</a>. Please read these to understand your data rights.
        </div>
        <div class="contactForm__checkbox">
            <label class="checkbox-control">I have read and agreed to the <a href="#">Privacy Policy</a>
                <input type="checkbox" name="checkox_01" class="checkbox-control__input" checked="checked">
                <span class="checkbox-control__checkmark"></span>
            </label>
        </div>
        <div class="contactForm__checkbox">
            <label class="checkbox-control">I agree to my data being stored and used to receive news and promotional materials, as well as to deliver service provided by InvestHK
                <input type="checkbox" name="checkox_02" class="checkbox-control__input" checked="checked">
                <span class="checkbox-control__checkmark"></span>
            </label>
        </div>
        <div class="contactForm__action">
            <button type="submit" class="button"><span>Submit</span></button>
        </div>
    </g:form>
</div>