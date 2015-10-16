<cfloop from="1" to="#FORM.total#" index="a">
<cfset firstip = #FORM["ip"& a]#>
<cfset Secondip = ReReplace("#FORM["ip"& a]#",'(?!=\.)[^.]*$', "0/24","ALL")>
<cfset Thirdip = ReReplace("#FORM["ip"& a]#",'[0-9]+.[0-9]+(?!=\.)[^.]*$', "0.0/16","ALL")>
<cfdump var="#firstip#"><br>
<cfdump var="#Secondip#"><br>
<cfdump var="#Thirdip#"><br>
</cfloop>
<br>

<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<script type="text/javascript" src="jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var max_fields      = 25; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    $(".total").html('<input type="hidden" name="total" value="1">');
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><div class="pure-control-group"><label for="ip">IP</label><input type="text" name="ip'+x+'"/><a href="#" class="remove_field">Remove</a></div></div>');
            $(".total").html('<input type="hidden" name="total" value="'+x+'">');
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
        $(".total").html('<input type="hidden" name="total" value="'+x+'">');
    })
});
</script>
<label>DO ANOTHER!</label>
<br>
<br>
<br>

<cfform class="pure-form pure-form-aligned" action="iplist.cfm" method="post">
    <div class="input_fields_wrap">
        <div class="pure-control-group">
            <label for="ip">IP</label>
            <input type="text" placeholder="50.59.14.1" name="ip1">
        </div>
    </div>
    <div class="total"></div>
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Submit</button>
            <button class="add_field_button pure-button pure-button-primary">Add Field</button>
        </div>
</cfform>