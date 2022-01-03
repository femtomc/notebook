#lang pollen

@font-face {
    font-family: julia_mono;
    font-style: normal;
    font-weight: normal;
    font-stretch: normal;
    font-display: auto;
src: url('../assets/fonts/JuliaMono-Regular.ttf') format('truetype');
}

@font-face {
    font-family: concourse_index;
    font-style: normal;
    font-weight: normal;
    font-stretch: normal;
    font-display: auto;
src: url('../assets/fonts/concourse_index_regular.woff2') format('woff2');
}

@font-face {
    font-family: concourse_index;
    font-style: normal;
    font-weight: normal;
    font-stretch: normal;
    font-display: auto;
src: url('../assets/fonts/concourse_index_regular.woff2') format('woff2');
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LLPtLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LJftLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LLvtLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LL_tLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LIftLtfOm8w.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LLPtLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LJftLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LLvtLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LL_tLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LIftLtfOm8w.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LLPtLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LJftLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LLvtLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LL_tLtfOm84TX.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Lora';
 font-style:italic;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIhMX1D_JOuMw_LIftLtfOm8w.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwf7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMw77I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwX7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwT7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwr7I_FMl_E.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwf7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMw77I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwX7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwT7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:600;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwr7I_FMl_E.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwf7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMw77I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwX7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwT7I_FMl_GW8g.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Lora';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/lora/v16/0QIvMX1D_JOuMwr7I_FMl_E.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFWJ0bf8pkAp6a.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFUZ0bf8pkAp6a.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFWZ0bf8pkAp6a.woff2) format("woff2");
 unicode-range:U+1F00-1FFF
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFVp0bf8pkAp6a.woff2) format("woff2");
 unicode-range:U+0370-03FF
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFWp0bf8pkAp6a.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFW50bf8pkAp6a.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:400;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFVZ0bf8pkAg.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOX-hpKKSTj5PW.woff2) format("woff2");
 unicode-range:U+0460-052F,
 U+1C80-1C88,
 U+20B4,
 U+2DE0-2DFF,
 U+A640-A69F,
 U+FE2E-FE2F
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOVuhpKKSTj5PW.woff2) format("woff2");
 unicode-range:U+0400-045F,
 U+0490-0491,
 U+04B0-04B1,
 U+2116
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOXuhpKKSTj5PW.woff2) format("woff2");
 unicode-range:U+1F00-1FFF
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOUehpKKSTj5PW.woff2) format("woff2");
 unicode-range:U+0370-03FF
}
@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOXehpKKSTj5PW.woff2) format("woff2");
 unicode-range:U+0102-0103,
 U+0110-0111,
 U+0128-0129,
 U+0168-0169,
 U+01A0-01A1,
 U+01AF-01B0,
 U+1EA0-1EF9,
 U+20AB
}
@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOXOhpKKSTj5PW.woff2) format("woff2");
 unicode-range:U+0100-024F,
 U+0259,
 U+1E00-1EFF,
 U+2020,
 U+20A0-20AB,
 U+20AD-20CF,
 U+2113,
 U+2C60-2C7F,
 U+A720-A7FF
}

@font-face {
 font-family:'Open Sans';
 font-style:normal;
 font-weight:700;
 font-display:swap;
 src:url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN7rgOUuhpKKSTjw.woff2) format("woff2");
 unicode-range:U+0000-00FF,
 U+0131,
 U+0152-0153,
 U+02BB-02BC,
 U+02C6,
 U+02DA,
 U+02DC,
 U+2000-206F,
 U+2074,
 U+20AC,
 U+2122,
 U+2191,
 U+2193,
 U+2212,
 U+2215,
 U+FEFF,
 U+FFFD
}
