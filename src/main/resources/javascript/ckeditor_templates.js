CKEDITOR.addTemplates('default',
    {
        // The name of the subfolder that contains the preview images of the templates.
        imagesPath: ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/jahiademo/images/ckeditor/',
        // Template definitions.
        templates: [
            {
                title: 'Grey testimonial',
                //image: 'list1.png',
                description: 'Grey testimonial',
                html: '<div id="testimonials-9" class="carousel slide testimonials testimonials-v2">'+
                '<div class="carousel-inner">'+
                '<div class="item active">'+
                '<p>Dignissimos similique sunt in ducimus qui blanditiis praesentium voluptatum delvoe molestias..</p>'+
                '<div class="testimonial-info">'+
                '<span class="testimonial-author">'+
                'User'+
                '<em>Web Developer, Unify Theme.</em>'+
                '</span>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'
            },
            {
                title: 'Color BG testimonial',
                //image: 'list1.png',
                description: 'Color BG testimonial',
                html: '<div id="testimonials-9" class="carousel slide testimonials testimonials-v2 testimonials-bg-default">'+
                '<div class="carousel-inner">'+
                '<div class="item active">'+
                '<p>Dignissimos similique sunt in ducimus qui blanditiis praesentium voluptatum delvoe molestias..</p>'+
                '<div class="testimonial-info">'+
                '<span class="testimonial-author">'+
                'User'+
                '<em>Web Developer, Unify Theme.</em>'+
                '</span>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'
            },
            {
                title: 'Default Panel',
                //image: 'list1.png',
                description: 'Default Panel',
                html: '<div class="panel panel-u">'+
                '<div class="panel-heading">'+
                '<h3 class="panel-title"><i class="fa fa-tasks"></i> Default Panel</h3>'+
                '</div>'+
                '<div class="panel-body">'+
                '<h4>Accusamus et iusto odio</h4>'+
                '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis ui officia de</p>'+
                '</div>'+
                '</div>'
            },
            {
                title: 'Dark Panel',
                //image: 'list1.png',
                description: 'Dark Panel',
                html: '<div class="panel panel-dark">'+
                '<div class="panel-heading">'+
                '<h3 class="panel-title"><i class="fa fa-tasks"></i> Dark Panel</h3>'+
                '</div>'+
                '<div class="panel-body">'+
                '<h4>Accusamus et iusto odio</h4>'+
                '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis ui officia de</p>'+
                '</div>'+
                '</div>'
            },
            {
                title: 'Light Panel',
                //image: 'list1.png',
                description: 'Light Panel',
                html: '<div class="panel panel-default">'+
                '<div class="panel-heading">'+
                '<h3 class="panel-title"><i class="fa fa-tasks"></i>Light Panel</h3>'+
                '</div>'+
                '<div class="panel-body">'+
                '<h4>Accusamus et iusto odio</h4>'+
                '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis ui officia de</p>'+
                '</div>'+
                '</div>'
            },
            {
                title: 'Table Example 1',
                //image: 'list1.png',
                description: 'Table Example 1',
                html: '<table class="table">'+
                '<thead>'+
                '<tr>'+
                '<th scope="col">#</th>'+
                '<th scope="col">First Name</th>'+
                '<th scope="col" class="hidden-sm">Last Name</th>'+
                '<th scope="col">Username</th>'+
                '<th scope="col">Status</th>'+
                '</tr>'+
                '</thead>'+
                '<tbody>'+
                '<tr>'+
                '<td>1</td>'+
                '<td>Mark</td>'+
                '<td class="hidden-sm">Otto</td>'+
                '<td>@mdo</td>'+
                '<td><span class="label label-warning">Expiring</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>2</td>'+
                '<td>Jacob</td>'+
                '<td class="hidden-sm">Thornton</td>'+
                '<td>@fat</td>'+
                '<td><span class="label label-success">Success</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>3</td>'+
                '<td>Larry</td>'+
                '<td class="hidden-sm">the Bird</td>'+
                '<td>@twitter</td>'+
                '<td><span class="label label-danger">Error!</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>4</td>'+
                '<td>htmlstream</td>'+
                '<td class="hidden-sm">Web Design</td>'+
                '<td>@htmlstream</td>'+
                '<td><span class="label label-info">Pending..</span></td>'+
                '</tr>'+
                '</tbody>'+
                '</table>'
            },
            {
                title: 'Table Example 2',
                //image: 'list1.png',
                description: 'Table Example 2',
                html: '<table class="table table-bordered">'+
                '<thead>'+
                '<tr>'+
                '<th scope="col">#</th>'+
                '<th scope="col">First Name</th>'+
                '<th scope="col" class="hidden-sm">Last Name</th>'+
                '<th scope="col">Username</th>'+
                '<th scope="col">Status</th>'+
                '</tr>'+
                '</thead>'+
                '<tbody>'+
                '<tr>'+
                '<td>1</td>'+
                '<td>Mark</td>'+
                '<td class="hidden-sm">Otto</td>'+
                '<td>@mdo</td>'+
                '<td><span class="label label-warning">Expiring</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>2</td>'+
                '<td>Jacob</td>'+
                '<td class="hidden-sm">Thornton</td>'+
                '<td>@fat</td>'+
                '<td><span class="label label-success">Success</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>3</td>'+
                '<td>Larry</td>'+
                '<td class="hidden-sm">the Bird</td>'+
                '<td>@twitter</td>'+
                '<td><span class="label label-danger">Error!</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>4</td>'+
                '<td>htmlstream</td>'+
                '<td class="hidden-sm">Web Design</td>'+
                '<td>@htmlstream</td>'+
                '<td><span class="label label-info">Pending..</span></td>'+
                '</tr>'+
                '</tbody>'+
                '</table>'
            },
            {
                title: 'Table Example 3',
                //image: 'list1.png',
                description: 'Table Example 3',
                html: '<table class="table table-striped">'+
                '<thead>'+
                '<tr>'+
                '<th scope="col">#</th>'+
                '<th scope="col">First Name</th>'+
                '<th scope="col" class="hidden-sm">Last Name</th>'+
                '<th scope="col">Username</th>'+
                '<th scope="col">Status</th>'+
                '</tr>'+
                '</thead>'+
                '<tbody>'+
                '<tr>'+
                '<td>1</td>'+
                '<td>Mark</td>'+
                '<td class="hidden-sm">Otto</td>'+
                '<td>@mdo</td>'+
                '<td><span class="label label-warning">Expiring</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>2</td>'+
                '<td>Jacob</td>'+
                '<td class="hidden-sm">Thornton</td>'+
                '<td>@fat</td>'+
                '<td><span class="label label-success">Success</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>3</td>'+
                '<td>Larry</td>'+
                '<td class="hidden-sm">the Bird</td>'+
                '<td>@twitter</td>'+
                '<td><span class="label label-danger">Error!</span></td>'+
                '</tr>'+
                '<tr>'+
                '<td>4</td>'+
                '<td>htmlstream</td>'+
                '<td class="hidden-sm">Web Design</td>'+
                '<td>@htmlstream</td>'+
                '<td><span class="label label-info">Pending..</span></td>'+
                '</tr>'+
                '</tbody>'+
                '</table>'
            }

        ]
    });