#lang pollen

a {
    text-decoration: none;
    color: #bd1f1f;
}

.vl {
  border-left: 2px solid black;
  margin-top:2rem;
  margin-right:3rem;
  height: 15rem;
}

summary {
    border-left: 2px solid gray;
    padding-left:1rem;
    font-size: 0.7rem;
    margin-left: 6rem;
    margin-right: 8rem;
}

p {
    margin-left:1rem;
    margin-right:1rem;
    padding-left:2rem;
    padding-right:2rem;
}

figure.latex {
    display: inline-block;
}

object.dot {
    display: block;
    margin-left:auto;
    margin-right:auto;
    vertical-align: top;
    max-width:500px;
}

img.latex {
    vertical-align: top;
    max-width: 100%;
}

figcaption.latex {
    text-align: center;
    font-style: italic;
    font-size: 0.9rem;
    margin-top:0.5rem;
    margin-bottom:0.5rem;
}

body {
    background-color: #513939;
    font-family: 'Droid Serif'; 
    border-radius:10px;
    margin-left:auto;
    margin-right:auto;
    padding-bottom:1rem;
    width:100%;
    max-width:1000px;
}

#doc {
    font-size: 14px;
    background-color: #dddddd;
    margin-bottom: 2rem;
    margin-left: 2rem;
    margin-right: 2rem;
    padding-left: 1rem;
    padding-right: 1rem;
    padding-bottom:0.5rem;
    padding-top:0.5rem;
    border-radius:10px;
    text-rendering: optimizeLegibility;
    font-feature-settings: 'kern' 1;
    font-family: 'PT Serif'; 
    color: #222;
    line-height: 1.4;
}

#navtable {
    display:flex;
    flex-wrap:nowrap;
    opacity: 1;
    z-index: 1;
    height: 3.5rem;
}

.box-link {
    text-decoration: none;
    font-size:45px;
    flex:35%;
    text-align:center;
}

h1, h2, h3 {
    font-family: 'Yanone Kaffeesatz';
    font-weight: normal;
}

hr {
    margin-top: 2rem;
    margin-bottom: 2rem;
}

div.itemize {
    margin-left:6rem;
    margin-right:6rem;
    max-width: 80%;
}

li::marker {
    font-family: concourse_index;
    font-style: normal;
}

.theorem {
    display: block;
    font-style: italic;
}

.theorem:before {
    content: "Theorem. ";
    font-weight: bold;
    font-style: normal;
}

.theorem[text]:before {
    content: "Theorem (" attr(text) ") ";
}

.definition {
    display: block;
    font-style: italic;
}

.definition:before {
    content: "Definition. ";
    font-weight: bold;
    font-style: normal;
}

.definition[text]:before {
    content: "Definition (" attr(text) ") ";
}

div.highlight {
    font-family: julia_mono;
    font-feature-settings: "zero", "ss01";
    font-variant-ligatures: contextual;
    background-color: #f0f0f0;
    margin-left: 3rem;
    margin-right: 3rem;
    padding-left: 1rem;
    padding-right: 1rem;
    border-radius: 10px;
}

div.quot {
    font-size: 1.0rem;
    background-color: #f0f0f0;
    margin-left: 4rem;
    margin-right: 4rem;
    padding-top:0.5rem;
    padding-bottom:0.5rem;
    padding-left: 1rem;
    padding-right: 1rem;
    border-radius: 10px;
    font-style: italic;
}

◊|code-tag|.◊|code-class| {
    padding: 0.1rem;
    font-family: julia_mono;
    font-size: 13px;
    font-feature-settings: "zero", "ss01";
    font-variant-ligatures: contextual;
}

.hljs {
    white-space: pre-wrap;
    word-wrap: break-word;
    font-family: julia_mono;
    font-feature-settings: "zero", "ss01";
    font-size: 13px;
    font-variant-ligatures: contextual;
}

code {
    font-family: julia_mono;
    font-feature-settings: "zero", "ss01";
    font-variant-ligatures: contextual;
}
