CKEDITOR.stylesSet.add('demo_styles', [

    // Inline styles
    {name: 'Paragraph lead', element: 'p', attributes: {'class': 'lead'}},
    {name: 'Drop cap', element: 'span', attributes: {'class': 'dropcap'}},
    {name: 'Drop cap inverse', element: 'span', attributes: {'class': 'dropcap-bg'}},
    {name: 'Drop cap rounded', element: 'span', attributes: {'class': 'dropcap-bg rounded-x'}},
    {name: 'Drop cap dark', element: 'span', attributes: {'class': 'dropcap dropcap-bg bg-color-dark'}},
    {name: 'Dotted divider', element: 'hr', attributes: {'class': 'devider deviser-dotted'}},
    {name: 'Dashed divider', element: 'hr', attributes: {'class': 'devider deviser-dashed'}},

    // Block styles
    {name: 'Headline div', element: 'div', attributes: {'class': 'headline'}},
    {name: 'Text right', element: 'span', attributes: {'class': 'text-right'}},
    {name: 'Text center', element: 'span', attributes: {'class': 'text-center'}},
    {name: 'Blockquote', element: 'blockquote'},
    {name: 'Blockquote color border', element: 'blockquote', attributes: {'class': 'bq-green'}},
    {name: 'Blockquote color border text right', element: 'blockquote', attributes: {'class': 'text-right bq-green'}},
    {name: 'Blockquote hero', element: 'blockquote', attributes: {'class': 'hero'}},
    {name: 'Blockquote hero dark bg', element: 'blockquote', attributes: {'class': 'hero hero-dark'}},
    {name: 'Blockquote hero color bg', element: 'blockquote', attributes: {'class': 'hero hero-default'}},
    {name: 'Blockquote text right', element: 'blockquote', attributes: {'class': 'text-right'}},
    {name: 'Tag box light border', element: 'div', attributes: {'class': 'tag-box tag-box-v3'}},
    {name: 'Tag box left border', element: 'div', attributes: {'class': 'tag-box tag-box-v2'}},
    {name: 'Tag box top border', element: 'div', attributes: {'class': 'tag-box tag-box-v1'}},
    {name: 'Paragraph BG primary', element: 'p', attributes: {'class': 'bg-primary'}},
    {name: 'Paragraph BG success', element: 'p', attributes: {'class': 'bg-success'}},
    {name: 'Paragraph BG info', element: 'p', attributes: {'class': 'bg-info'}},
    {name: 'Paragraph BG warning', element: 'p', attributes: {'class': 'bg-warning'}},
    {name: 'Paragraph BG danger', element: 'p', attributes: {'class': 'bg-danger'}},
    {name: 'Heading Double Strip Style', element: 'div', attributes: {'class': 'heading heading-v1'}},
    {name: 'Heading Double Dashed Style', element: 'div', attributes: {'class': 'heading heading-v2'}},
    {name: 'Heading Double Dotted Style', element: 'div', attributes: {'class': 'heading heading-v3'}},
    {name: 'Heading Strip Style', element: 'div', attributes: {'class': 'heading heading-v4'}},
    {name: 'Heading Dashed Style', element: 'div', attributes: {'class': 'heading heading-v5'}},
    {name: 'Heading Dotted Style', element: 'div', attributes: {'class': 'heading heading-v6'}},


    // Shadow effects
    {name: 'Shadow effect 1', element: 'div', attributes: {'class': 'tag-box tag-box-v3 box-shadow shadow-effect-1'}},
    {name: 'Shadow effect 2', element: 'div', attributes: {'class': 'tag-box tag-box-v3 box-shadow shadow-effect-2'}},
    {name: 'Shadow effect 3', element: 'div', attributes: {'class': 'tag-box tag-box-v3 box-shadow shadow-effect-3'}},
    {name: 'Shadow effect 4', element: 'div', attributes: {'class': 'tag-box tag-box-v3 box-shadow shadow-effect-4'}},
]);

CKEDITOR.editorConfig = function (config) {
    config.siteKey = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteKey : '';
    config.workspace = (typeof contextJsParameters != 'undefined') ? contextJsParameters.workspace : '';

    config.toolbar_Full = [
        ['Source', '-', 'Preview', '-', 'Templates'],
        ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Print', 'wsc', 'Scayt', 'ACheck'],
        ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
        //['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
        '/',
        ['Bold', 'Italic', 'Underline', 'Strike'],
        ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote', 'CreateDiv'],
        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['Link', 'Unlink', 'Anchor'],
        ['Image', 'Flash', 'Table', 'HorizontalRule', 'SpecialChar', 'Iframe'],
        '/',
        ['Macros', 'Styles', 'Format', 'FontSize', 'TextColor', 'BGColor'],
        ['Maximize', 'ShowBlocks', '-', 'About']
    ];

    config.toolbar_Light = config.toolbar_Full;
    config.toolbar_Basic = config.toolbar_Full;
    config.toolbar_Mini = config.toolbar_Full;
    config.toolbar_User = config.toolbar_Full;

    // Apply new styles
    config.stylesSet = 'demo_styles';

    // Load CSS also in CKEditor
    config.contentsCss = [
        ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/dx-base-demo-templates/css/app.css'
    ];


    // Loading custom templates
    config.templates_files = [((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/dx-base-demo-templates/javascript/ckeditor_templates.js'];
}



