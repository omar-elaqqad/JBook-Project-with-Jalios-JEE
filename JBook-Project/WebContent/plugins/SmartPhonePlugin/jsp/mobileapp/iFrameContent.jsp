<script type="text/javascript">
  // is MobileApp
  if (localStorage.getItem("context") === "mobileApp") {
    document.addEventListener("click", function (event) {
      if (event === undefined) {
        return;
      }

      if (
        event.target.matches('[target="_blank"]') ||
        event.target.matches('[rel="external"]')
      ) {
        // Don't follow the link
        event.preventDefault();
        let url = event.target.getAttribute("href");
        if (url === undefined) {
          return;
        }

        var redirectUrlToTopFrameEvent = new CustomEvent(
          "jmobile-redirect-to-top-frame",
          {
            detail: {
              redirect: url,
            },
          }
        );
        window.parent.dispatchEvent(redirectUrlToTopFrameEvent);
      }
    });

    window.open = function (url) {
      var redirectUrlToTopFrameEvent = new CustomEvent(
        "jmobile-redirect-to-top-frame",
        {
          detail: {
            redirect: url,
          },
        }
      );
      window.parent.dispatchEvent(redirectUrlToTopFrameEvent);
    };
  }
</script>
