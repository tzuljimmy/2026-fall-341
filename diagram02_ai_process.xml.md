<mxfile host="app.diagrams.net" agent="Gemini">
  <diagram name="BPMN Process" id="bpmn-process-1">
    <mxGraphModel dx="1414" dy="743" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1100" pageHeight="850" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="start_event" parent="1" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;strokeWidth=1;fillColor=#ffffff;strokeColor=#000000;" value="" vertex="1">
          <mxGeometry height="30" width="30" x="80" y="240" as="geometry" />
        </mxCell>
        <mxCell id="act_take_order" parent="1" style="rounded=1;whiteSpace=wrap;html=1;arcSize=20;fillColor=#ffffff;strokeColor=#000000;" value="Take the customer order" vertex="1">
          <mxGeometry height="60" width="120" x="150" y="225" as="geometry" />
        </mxCell>
        <mxCell id="act_credit_check" parent="1" style="rounded=1;whiteSpace=wrap;html=1;arcSize=20;fillColor=#ffffff;strokeColor=#000000;" value="Run the credit check" vertex="1">
          <mxGeometry height="60" width="120" x="310" y="225" as="geometry" />
        </mxCell>
        <mxCell id="gateway_credit" parent="1" style="rhombus;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;" value="" vertex="1">
          <mxGeometry height="70" width="70" x="470" y="220" as="geometry" />
        </mxCell>
        <mxCell id="gateway_label" parent="1" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;" value="&lt;font style=&quot;font-size: 9px;&quot;&gt;Credit approved?&lt;/font&gt;" vertex="1">
          <mxGeometry height="30" width="90" x="460" y="240" as="geometry" />
        </mxCell>
        <mxCell id="act_ship_goods" parent="1" style="rounded=1;whiteSpace=wrap;html=1;arcSize=20;fillColor=#ffffff;strokeColor=#000000;" value="Ship the goods" vertex="1">
          <mxGeometry height="60" width="120" x="570" y="230" as="geometry" />
        </mxCell>
        <mxCell id="act_record_order" parent="1" style="rounded=1;whiteSpace=wrap;html=1;arcSize=20;fillColor=#ffffff;strokeColor=#000000;" value="Record the order" vertex="1">
          <mxGeometry height="60" width="120" x="720" y="230" as="geometry" />
        </mxCell>
        <mxCell id="end_event_1" parent="1" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;strokeWidth=4;fillColor=#ffffff;strokeColor=#000000;" value="" vertex="1">
          <mxGeometry height="30" width="30" x="860" y="245" as="geometry" />
        </mxCell>
        <mxCell id="act_reject_order" parent="1" style="rounded=1;whiteSpace=wrap;html=1;arcSize=20;fillColor=#ffffff;strokeColor=#000000;" value="Reject the order" vertex="1">
          <mxGeometry height="60" width="120" x="450" y="350" as="geometry" />
        </mxCell>
        <mxCell id="end_event_2" parent="1" style="ellipse;whiteSpace=wrap;html=1;aspect=fixed;strokeWidth=4;fillColor=#ffffff;strokeColor=#000000;" value="" vertex="1">
          <mxGeometry height="30" width="30" x="590" y="365" as="geometry" />
        </mxCell>
        <mxCell id="flow_1" edge="1" parent="1" source="start_event" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="act_take_order" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry" />
        </mxCell>
        <mxCell id="flow_2" edge="1" parent="1" source="act_take_order" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="act_credit_check" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry" />
        </mxCell>
        <mxCell id="flow_3" edge="1" parent="1" source="act_credit_check" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="gateway_credit" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry" />
        </mxCell>
        <mxCell id="flow_approved" edge="1" parent="1" source="gateway_credit" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=0.5;exitY=0;exitDx=0;exitDy=0;" target="act_ship_goods" value="approved">
          <mxGeometry height="50" relative="1" width="50" x="0.5972" y="23" as="geometry">
            <mxPoint y="-1" as="offset" />
            <Array as="points">
              <mxPoint x="545" y="260" />
            </Array>
            <mxPoint x="505" y="220" as="sourcePoint" />
            <mxPoint x="600" y="170" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="flow_4" edge="1" parent="1" source="act_ship_goods" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="act_record_order" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry" />
        </mxCell>
        <mxCell id="flow_5" edge="1" parent="1" source="act_record_order" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="end_event_1" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry" />
        </mxCell>
        <mxCell id="flow_rejected" edge="1" parent="1" source="gateway_credit" style="endArrow=classic;html=1;rounded=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" value="rejected">
          <mxGeometry height="50" relative="1" width="50" x="0.3333" y="35" as="geometry">
            <mxPoint as="offset" />
            <Array as="points">
              <mxPoint x="505" y="340" />
            </Array>
            <mxPoint x="505" y="290" as="sourcePoint" />
            <mxPoint x="505" y="350" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="flow_6" edge="1" parent="1" source="act_reject_order" style="endArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="end_event_2" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
