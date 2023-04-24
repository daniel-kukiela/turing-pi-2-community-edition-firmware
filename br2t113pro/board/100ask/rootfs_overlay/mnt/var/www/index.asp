<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<link rel="icon" href="https://turingpi.com/wp-content/uploads/2020/09/logo.svg" sizes="32x32">
		<link rel="icon" href="https://turingpi.com/wp-content/uploads/2020/09/logo.svg" sizes="192x192">
		<meta name="viewport" content="width=device-width" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">

		<meta http-equiv="content-security-policy" content="">
		<link rel="modulepreload" href="./_app/immutable/entry/start.983dca2f.js">
		<link rel="modulepreload" href="./_app/immutable/chunks/index.c0cedb41.js">
		<link rel="modulepreload" href="./_app/immutable/chunks/singletons.a907a0c9.js">
		<link rel="modulepreload" href="./_app/immutable/chunks/index.f3ed2e13.js">
		<link rel="modulepreload" href="./_app/immutable/entry/app.ac5a9104.js">
	</head>
	<body data-sveltekit-preload-data="hover">
		<div id="app" style="display: contents">
			<script>
				{
					__sveltekit_ji7i1l = {
						base: new URL(".", location).pathname.slice(0, -1),
						env: {"PUBLIC_SERVICE_API":""}
					};

					const element = document.currentScript.parentElement;

					Promise.all([
						import("./_app/immutable/entry/start.983dca2f.js"),
						import("./_app/immutable/entry/app.ac5a9104.js")
					]).then(([kit, app]) => {
						kit.start(app, element);
					});
				}
			</script>
		</div>
	</body>
</html>
