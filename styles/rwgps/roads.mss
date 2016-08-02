/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom=5][zoom=6] {
  [type='motorway'] { line-color: @motorway_fill; }
  [type='trunk'] { line-color: @trunk_fill; }
  [zoom=5] {
    [type='motorway'] { line-width: 0.8; }
    [type='trunk'] { line-width: 0.8; }
  }
  [zoom=6] {
    [type='motorway'] { line-width: 0.8; }
    [type='trunk'] { line-width: 0.8; }
  }
}
#roads_low::outline[zoom=5][zoom=6] {
  [type='motorway'] { line-color: @motorway_line; }
  [type='trunk'] { line-color: @trunk_line; }
  [zoom=5] {
    [type='motorway'] { line-width: 1.0; }
    [type='trunk'] { line-width: 1.0; } }
  [zoom=6] {
    [type='motorway'] { line-width: 1.3; }
    [type='trunk'] { line-width: 1.3; } }
}

#roads_med::outline[zoom=7][zoom=8] {
  [type='primary'] { line-color: @primary_line; }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line; }

  [zoom=7] {
    [type='primary'] { line-width: 1.0; line-opacity: 0.8 }
    [type='motorway'] { line-width: 2.5; }
    [type='trunk'] { line-width: 2.5; } }
  [zoom=8] {
    [type='primary'] { line-width: 1.0; line-opacity: 0.8 }
    [type='motorway'] { line-width: 2.5; }
    [type='trunk'] { line-width: 2.5; } }
}

#roads_med[zoom=7][zoom=8] {
  [type='primary'] { line-color: @primary_fill; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill; }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill; }
  
  [zoom=7] {
    [type='primary'] { line-width: 0; }
    [type='motorway'] { line-width: 1.0; line-opacity: 0.8; }
    [type='trunk'] { line-width: 1.0; line-opacity: 0.8; } }
  [zoom=8] {
    [type='primary'] { line-width: 0.0; }
    [type='motorway'] { line-width: 1.5; }
    [type='trunk'] { line-width: 1.5; } }
}

#roads_med_high::outline[zoom>=9][zoom<=12] {
  [type='secondary'] { line-color: @secondary_line; }
  [type='primary'] { line-color: @primary_line; }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line; }

  [zoom>=9] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 1.2; } }
	[type='motorway'],[type='trunk'] { line-width: 2.5; }
  [zoom=10] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 1.4; } }
    [type='motorway'],[type='trunk'] { line-width: 2.6; }
  [zoom=11] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 1.8; } }
  	[type='motorway'],[type='trunk'] { line-width: 2.8; }
  [zoom=12] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 3.4; } }
    [type='motorway'],[type='trunk'] { line-width: 4.6; }
}

#roads_med_high[zoom>=9][zoom<=12] {
  [type='primary'] { line-color: @primary_fill; }
  [type='secondary'] { line-color: @secondary_fill; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill; }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill; }
  
  [zoom=9] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.6; } }
    [type='motorway'],[type='trunk'] { line-width: 1.5; }
  [zoom=10] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.8; } }
    [type='motorway'],[type='trunk'] { line-width: 1.8; }
  [zoom=11] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 1.2; } }
    [type='motorway'],[type='trunk'] { line-width: 2.2; }
  [zoom=12] {
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 1.2; } }
  	[type='motorway'],[type='trunk'] { line-width: 2.2; }
}

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */
@rdz11_maj: 1.6; @rdz11_med: 0.8; @rdz11_min: 0.4;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 6;   @rdz14_med: 2.5; @rdz14_min: 1.6;
@rdz15_maj: 8;   @rdz15_med: 6;   @rdz15_min: 4;
@rdz16_maj: 10;   @rdz16_med: 8;   @rdz16_min: 6;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;

/* ---- Casing ----------------------------------------------- */

#roads_high_case::outline[zoom>=13][zoom<=20],
#tunnel[render='1_outline'][zoom>=13][zoom<=20],
#bridge[render='1_outline'][zoom>=13][zoom<=20]{
  /* -- colors & styles -- */
  line-cap: round;
  line-join: round;
  line-color: @standard_case;
  [bridge=1] { line-color: @standard_case * 0.8; }
  [tunnel=1] { line-dasharray: 3,3; }
  [bridge=1],
  [tunnel=1] {
    line-cap: butt;
  }
  
  [stylegroup='railway'] {
    line-color: fadeout(@land,50%);
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case * 0.8; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case * 0.8; }
  }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case * 0.8; }
  }

  [stylegroup='foot'] {
    line-color: @foot_line;
    [bridge=1] { line-color: @foot_line * 0.8; }
  }
  [stylegroup='cycle'] {
    line-color: @cycle_line;
    [bridge=1] { line-color: @cycle_line * 0.8; }
  }

  /* -- widths -- */
  [zoom=13] {
    [stylegroup='railway']  { line-width: 0; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + 2; }
    [stylegroup='motorway'] { line-width: @rdz13_maj + 2; }
    [stylegroup='foot'] 	{ line-width: 1.2; }
    [stylegroup='cycle'] 	{ line-width: 1.2; }
  }
  [zoom=14] {
    [stylegroup='railway']  { line-width: 0; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + 1.2; }
    [stylegroup='motorway'] { line-width: @rdz14_maj + 2.0; }
    [stylegroup='foot'] 	{ line-width: 2; }
    [stylegroup='cycle'] 	{ line-width: 2; }
  }
  [zoom=15] {
    [stylegroup='railway']  { line-width: 1.5 + 2; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='foot'] 	{ line-width: 3.5; }
    [stylegroup='cycle'] 	{ line-width: 3.5; }
  }
  [zoom=16] {
    [stylegroup='railway']  { line-width: 2 + 2; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 2.5; }
    [stylegroup='motorway'] { line-width: @rdz16_maj + 2.5; }
    [stylegroup='foot'] 	{ line-width: 5.5; }
    [stylegroup='cycle'] 	{ line-width: 5.5; }
  }
  [zoom>=17] {
    [stylegroup='railway']  { line-width: 3 + 4; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 2.5; }
    [stylegroup='motorway'] { line-width: @rdz17_maj + 3; }
    [stylegroup='foot'] 	{ line-width: 7; }
    [stylegroup='cycle'] 	{ line-width: 7; }
  }
  [zoom>=18] {
    [stylegroup='railway']  { line-width: 4 + 6; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 4; }
    [stylegroup='motorway'] { line-width: @rdz18_maj + 4; }
    [stylegroup='foot'] 	{ line-width:8; }
    [stylegroup='cycle'] 	{ line-width:8; }
  }
}


#roads_high[zoom>=13][zoom<=20],
#tunnel[render='3_inline'][zoom>=13][zoom<=20],
#bridge[render='3_inline'][zoom>=13][zoom<=20]{
  /* -- colors & styles -- */
  line-color: @standard_fill;

  [stylegroup='cycle'] {
    line-color: @cycle_fill;
    [tunnel=1] { line-color: lighten(@cycle_fill, 10%); }
  }
  [stylegroup='foot'] {
    line-color: @foot_fill;
    [tunnel=1] { line-color: lighten(@foot_fill, 10%); }
  }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    [tunnel=1] { line-color: lighten(@motorway_fill, 10%); }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { line-color: lighten(@trunk_fill, 10%); }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { line-color: lighten(@primary_fill, 10%); }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color:@secondary_fill;
    [tunnel=1] { line-color: lighten(@secondary_fill, 10%); }
  }
  [stylegroup='railway'] {
    line-color: @rail_line;
    line-dasharray: 1,1;
    [type='subway'] { line-opacity: 0.67; }
    [zoom>15] { line-dasharray: 1,2; } 
  }



  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'],
  [stylegroup='foot'],
  [stylegroup='cycle'] {
    line-cap: round;
    line-join: round;
  }

  [tunnel=1] {
    line-cap: butt;
  }

  [zoom=13] {
    [stylegroup='service']  { line-width: 0 }
    [stylegroup='noauto']  { line-width: 0 }
    [stylegroup='railway']  { line-width: 0.8; }
    [stylegroup='minorroad']{ line-width: 1.0; }
    [stylegroup='mainroad'] { line-width: 3.0; }
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='foot'] 	{ line-width: 0.8; }
    [stylegroup='cycle'] 	{ line-width: 0.8; }
  }
  [zoom=14] {
    [stylegroup='cycle'] 	{ line-width: 1; }
    [stylegroup='foot'] 	{ line-width: 1; }
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: 4.0; }
    [stylegroup='minorroad']{ line-width: 1.0; }
    [stylegroup='railway']  { line-width: 1; }
    [stylegroup='service']  { line-width: 0 }
    [stylegroup='noauto']  { line-width: 0 }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']  { line-width: @rdz15_min / 3; }
    [stylegroup='railway']  { line-width: 1.5; }
    [stylegroup='foot'] 	{ line-width: 1.5; }
    [stylegroup='cycle'] 	{ line-width: 1.5; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='service']  { line-width: @rdz16_min / 3; }
    [stylegroup='railway']  { line-width: 2; }
    [stylegroup='foot'] 	{ line-width: 3; }
    [stylegroup='cycle'] 	{ line-width: 3; }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj; }
    [stylegroup='mainroad'] { line-width: @rdz17_med; }
    [stylegroup='minorroad']{ line-width: @rdz17_min; }
    [stylegroup='service']  { line-width: @rdz17_min / 3; }
    [stylegroup='railway']  { line-width: 3; }
    [stylegroup='foot'] 	{ line-width: 4; }
    [stylegroup='cycle'] 	{ line-width: 4; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj; }
    [stylegroup='mainroad'] { line-width: @rdz18_med; }
    [stylegroup='minorroad']{ line-width: @rdz18_min; }
    [stylegroup='service']  { line-width: @rdz18_min / 2; }
    [stylegroup='railway']  { line-width: 4; }
    [stylegroup='foot'] 	{ line-width: 5; }
    [stylegroup='cycle'] 	{ line-width: 5; }
  }
}

/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'][zoom>=14][zoom<=20],
#bridge[render='2_line'][zoom>=14][zoom<=20]{
  /* -- colors & styles -- */
  [stylegroup='railway'] {
    line-color: @land;
    line-join: round;
  }
  /* -- widths -- */
  [zoom=14] {
    [stylegroup='railway']  { line-width: 1 + 1; }
  }
  [zoom=15] {
    [stylegroup='railway']  { line-width: 1.5 + 1; }
  }
  [zoom=16] {
    [stylegroup='railway']  { line-width: 2 + 1; }
  }
  [zoom=17] {
    [stylegroup='railway']  { line-width: 3 + 2; }
  }
  [zoom>=18] {
    [stylegroup='railway']  { line-width: 4 + 3; }
  }
}

/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom=14] { marker-width:@rdz14_min * 1.1; }
  [zoom=15] { marker-width:@rdz15_min * 1.1; }
  [zoom=16] { marker-width:@rdz16_min * 1.1; }
  [zoom=17] { marker-width:@rdz17_min * 1.1; }
  [zoom>=18] { marker-width:@rdz18_min * 1.1; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'] {
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:2; }
    [zoom=16]{ line-width:3; }
    [zoom=17]{ line-width:4; }
    [zoom>17]{ line-width:5; }
  }
}

/******************************************************************* */
