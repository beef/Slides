module SlidesHelper

  def create_banner(flash, dom_id, width, height, bgcolour = "ffffff", interval=10)
    "<script type=\"text/javascript\" src=\"/javascripts/swfobject.js\"></script>\n<script type=\"text/javascript\">$(document).ready(function(){ if(swfobject) swfobject.embedSWF(\"#{flash}\", \"#{dom_id}\", \"#{width}\", \"#{height}\", \"9.0.0\", null, null, {menu: \"false\", bgcolor: \"\##{bgcolour}\"}, {interval:\"#{interval}\"}); }</script>"
  end
end
