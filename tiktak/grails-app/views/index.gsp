<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Tik-Tak</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 14em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 1.1em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status h1 {
			    color: black;
				text-transform: uppercase;
				font-size: 1.3em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="menu">
			<h1>Gestione</h1>
			<ul>
			  <li class="controller"><g:link controller="MyTracking">${message(code: 'myTracking.label', default: 'My trackings')}</g:link></li>
			  <li class="controller"><g:link controller="Tracking">${message(code: 'tracking.label', default: 'Tracking')}</g:link></li>			  
			</ul>
			<br/>
			<h1>Tabelle di base</h1>
			<ul>
			   <li class="controller"><g:link controller="Activity">${message(code: 'activity.label', default: 'Activity')}</g:link></li>
			   <li class="controller"><g:link controller="Service">${message(code: 'service.label', default: 'Service')}</g:link></li>
			   <li class="controller"><g:link controller="Project">${message(code: 'project.label', default: 'Project')}</g:link></li>
			   <li class="controller"><g:link controller="Person">${message(code: 'person.label', default: 'Person')}</g:link></li>
			   <li class="controller"><g:link controller="ProjectPerson">${message(code: 'projectPerson.label', default: 'Project per Person')}</g:link></li>
			</ul>
		</div>
		<div id="page-body" role="about">
			<h1>Welcome to Tik-Tak</h1>
			<p>.......</p>
		</div>
	</body>
</html>
