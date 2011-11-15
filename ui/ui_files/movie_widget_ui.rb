# encoding: utf-8
=begin
** Form generated from reading ui file 'movie_widget.ui'
**
** Created: Tue Nov 15 17:12:19 2011
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Form
    attr_reader :gridLayout
    attr_reader :poster
    attr_reader :frame
    attr_reader :formLayout
    attr_reader :label_3
    attr_reader :imdb_rating
    attr_reader :label_4
    attr_reader :custom_rating
    attr_reader :label_9
    attr_reader :release_date
    attr_reader :label_7
    attr_reader :tagline
    attr_reader :label_6
    attr_reader :title

    def setupUi(form)
    if form.objectName.nil?
        form.objectName = "form"
    end
    form.resize(917, 572)
    @gridLayout = Qt::GridLayout.new(form)
    @gridLayout.objectName = "gridLayout"
    @poster = ImageLabel.new(form)
    @poster.objectName = "poster"

    @gridLayout.addWidget(@poster, 1, 0, 1, 1)

    @frame = Qt::Frame.new(form)
    @frame.objectName = "frame"
    @frame.frameShape = Qt::Frame::StyledPanel
    @frame.frameShadow = Qt::Frame::Raised
    @formLayout = Qt::FormLayout.new(@frame)
    @formLayout.objectName = "formLayout"
    @formLayout.fieldGrowthPolicy = Qt::FormLayout::ExpandingFieldsGrow
    @label_3 = Qt::Label.new(@frame)
    @label_3.objectName = "label_3"

    @formLayout.setWidget(0, Qt::FormLayout::LabelRole, @label_3)

    @imdb_rating = Qt::DoubleSpinBox.new(@frame)
    @imdb_rating.objectName = "imdb_rating"

    @formLayout.setWidget(0, Qt::FormLayout::FieldRole, @imdb_rating)

    @label_4 = Qt::Label.new(@frame)
    @label_4.objectName = "label_4"

    @formLayout.setWidget(1, Qt::FormLayout::LabelRole, @label_4)

    @custom_rating = Qt::DoubleSpinBox.new(@frame)
    @custom_rating.objectName = "custom_rating"

    @formLayout.setWidget(1, Qt::FormLayout::FieldRole, @custom_rating)

    @label_9 = Qt::Label.new(@frame)
    @label_9.objectName = "label_9"

    @formLayout.setWidget(2, Qt::FormLayout::LabelRole, @label_9)

    @release_date = Qt::DateEdit.new(@frame)
    @release_date.objectName = "release_date"

    @formLayout.setWidget(2, Qt::FormLayout::FieldRole, @release_date)


    @gridLayout.addWidget(@frame, 1, 1, 1, 1)

    @label_7 = Qt::Label.new(form)
    @label_7.objectName = "label_7"

    @gridLayout.addWidget(@label_7, 2, 1, 1, 1)

    @tagline = Qt::Label.new(form)
    @tagline.objectName = "tagline"

    @gridLayout.addWidget(@tagline, 3, 0, 1, 1)

    @label_6 = Qt::Label.new(form)
    @label_6.objectName = "label_6"
    @label_6.wordWrap = true

    @gridLayout.addWidget(@label_6, 4, 0, 1, 1)

    @title = Qt::Label.new(form)
    @title.objectName = "title"
    @title.styleSheet = "font: 75 48pt \"Ubuntu\";\n" \
"text-style: center;"

    @gridLayout.addWidget(@title, 0, 0, 1, 2)

    title.raise()
    poster.raise()
    frame.raise()
    label_7.raise()
    tagline.raise()
    label_6.raise()
    label_7.raise()

    retranslateUi(form)

    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def setup_ui(form)
        setupUi(form)
    end

    def retranslateUi(form)
    form.windowTitle = my_translate("Form", nil)
    @poster.text = my_translate("POSTER", nil)
    @label_3.text = my_translate("\316\222\316\261\316\270\316\274. IMDB", nil)
    @label_4.text = my_translate("\316\222\316\261\316\270\316\274. \316\247\317\201\316\256\317\203\317\204\316\267", nil)
    @label_9.text = my_translate("\316\227\316\274. \316\232\317\205\316\272\316\273\316\277\317\206\316\277\317\201\316\257\316\261\317\202:", nil)
    @label_7.text = my_translate("\316\240\317\201\317\211\317\204\316\261\316\263\317\211\316\275\316\271\317\203\317\204\316\277\317\215\316\275:", nil)
    @tagline.text = my_translate("Can't Stop the Flow", nil)
    @label_6.text = ''
    @title.text = my_translate("Serenity", nil)
    end # retranslateUi

    def retranslate_ui(form)
        retranslateUi(form)
    end

end

module Ui
    class Form < Ui_Form
    end
end  # module Ui

