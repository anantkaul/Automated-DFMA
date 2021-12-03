import requests

# apikey = input("Enter your API Key: ")
resource = input("Enter the File Path or Hash: ")
url = 'https://www.virustotal.com/vtapi/v2/file/report'
params = {'apikey': 'a06ff59f6a85d283dcc47caf6313a2e61490ae1d3662f253348617627bc59dcb', 'resource': resource}
response = requests.get(url, params=params)
json_parse = response.json()
# print(response.json())

vt_md5 = json_parse['md5']
vt_sha256 = json_parse['sha256']
vt_sha1 = json_parse['sha1']
vt_scan_date = json_parse['scan_date']
vt_positives = json_parse['positives']
vt_total = json_parse['total']
vt_scan_id = json_parse['scan_id']
vt_permalink = json_parse['permalink']

file_out = open('vtscan-report.html', 'w')

# the html code which will go in the file vtscan-report.html
html_template = """
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <title>VT Scan</title>
    <link rel="stylesheet" href="css/nc.css" media="screen">
    <link rel="stylesheet" href="css/first.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery-1.9.1.min.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nc.js" defer=""></script>
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aldrich:400">
  <!--===============================================================================================-->	
	  <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
  <!--===============================================================================================-->
   
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
"""

html_template += f"""
  </head>

  </head>
  <body data-home-page="https://website1068865.nicepage.io/first.html?version=5a7d8db9-feeb-4cd6-b772-9b3f7f1e1a03" data-home-page-title="first" class="u-body"> 
    <section class="u-clearfix u-section-1" src="" id="sec-04a6">
      <div class="u-clearfix u-sheet u-sheet-1">
        <img class="u-image u-image-1" src="images/g7bf7c2329c305b9f8ca009a4606b3211abd67f57553d5407c843d188f7cc7659f05463a89e2ec1bbac80d999b730d46013ef1ebed98eae6eeafe7ed3c42c5a9a_1280.png" data-image-width="1081" data-image-height="1280" data-animation-name="slideIn" data-animation-duration="1000" data-animation-direction="Right">
        <div class="u-border-15 u-border-palette-1-base u-shape u-shape-right u-shape-1" data-animation-name="slideIn" data-animation-duration="1000" data-animation-direction="Left"></div>
        <div class="u-border-no-bottom u-border-no-left u-border-no-right u-border-no-top u-container-style u-group u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <img class="u-image u-image-2" src="images/logo.png" data-image-width="472" data-image-height="129" data-animation-name="fadeIn" data-animation-duration="1000" data-animation-direction="Down">
            <p class="u-align-justify u-custom-font u-large-text u-text u-text-variant u-text-1" data-animation-name="fadeIn" data-animation-duration="1000" data-animation-direction="Down">
              <span class="u-text-custom-color-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 1.5rem;">positives:</span>
              </span>
              <span style="font-size: 1.5rem;">&nbsp; <span style="font-style: normal;">{vt_positives}/{vt_total}</span>
              </span>
              <span class="u-text-custom-color-1">
                <br>
                <span style="font-size: 1.5rem;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Scan Date:</span>
              </span>
              <span style="font-size: 1.5rem;">&nbsp; <span style="font-style: normal;">{vt_scan_date}</span>
              </span>
              <br>
              <br>
              <br>
              <br>
              <span class="u-text-custom-color-1">md5:</span>&nbsp; <span style="font-style: normal; font-size: 1.125rem;">{vt_md5}</span>
              <br>
              <span class="u-text-custom-color-1">sha1:</span>&nbsp; <span style="font-style: normal; font-size: 1rem;">
                <span style="font-size: 1.125rem;">{vt_sha1}</span>
                <br>
                <span style="font-size: 1.25rem;" class="u-text-custom-color-1">sha256:</span>&nbsp; <span style="font-size: 1.125rem;"> {vt_sha256}</span>
              </span>
            </p>
          </div>
        </div>
        <a href="{vt_permalink}" class="u-btn u-btn-round u-button-style u-custom-font u-hover-palette-1-dark-1 u-palette-1-base u-radius-40 u-btn-1" data-animation-name="fadeIn" data-animation-duration="1000" data-animation-direction="Up">EXPLORE More</a>
      </div>
    </section>

    <br>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
                <div class="table100 ver3 m-b-110">
                    <div class="table100-head">
                        <table>
                            <thead>
                                <tr class="row100 head">
                                    <th class="cell100 column1">Scanner</th>
                                    <th class="cell100 column2">Detected</th>
                                    <th class="cell100 column3">Result</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    
                    <div class="table100-body js-pscroll">
						<table>
							<tbody>
"""

scanners = json_parse["scans"].keys()
for scanner in scanners:
    detected = json_parse["scans"][scanner]["detected"]
    result = json_parse["scans"][scanner]["result"]
    html_template += f"""
                                <tr class="row100 body">
									<td class="cell100 column1">{scanner}</td>
									<td class="cell100 column2">{detected}</td>
									<td class="cell100 column3">{result}</td>
								</tr>
    """

html_template += """
							</tbody>
						</table>
					</div>
				</div>
            <div>
        <div>
    <div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
"""
  
# writing the code into the file
file_out.write(html_template)
file_out.close()
