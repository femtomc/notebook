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

div.header {
  display: flex;
  font-size: 1.0rem;
  align-items: center;
  background: #fff;
}

#logo {
  display: inline-block;
  margin-left: 2rem;
  padding-left: 1rem;
  padding-right: 1rem;
  margin-bottom: 0rem;
  padding-top:1rem;
}

#logo svg {
width: 30px;
height: 30px;
}

summary {
    border-left: 4px solid gray;
    color: #777777;
    border-radius: 10px;
    padding: 10px;
    padding-left:1rem;
    font-size: 1.0rem;
    background: #f0f0f0;
}

div.note {
    border-left: 2px solid gray;
    color: #777777;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 1rem;
    padding-right: 1rem;
    font-size: 1.0rem;
    background: #f0f0f0;
}


figure.latex {
    display: inline-block;
}

figure { 
    padding: 4px;
    margin: auto;
    max-width: 100%;
}

figcaption {
    margin-left: 1rem;
    margin-right: 1rem;
    padding-left: 2rem;
    padding-right: 2rem;
    text-align: center;
    font-size: 1.0rem;
}

object.dot {
display: block;
         margin-left:auto;
         margin-right:auto;
         vertical-align: top;
         max-width: 100%;
}

#search {
    margin-right: 2rem;
    margin-bottom: 0rem;
    padding-top: 1rem;
}

img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    max-width: 100%;
}

figcaption.latex {
    text-align: center;
    font-style: italic;
    font-size: 1.0rem;
    margin-top:0.5rem;
    margin-bottom:0.5rem;
}

body {
    background-color: #fdfdfd;
font:400 16.5px/1.65 "Lora","Helvetica Neue",Helvetica,Arial,sans-serif;
     border-radius:10px;
     margin-left:auto;
     margin-right:auto;
     padding-bottom:1rem;
width:100%;
      max-width: 800px;
}

#doc {
    background-color: #fdfdfd;
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
    font:400 1.2rem "Lora","Helvetica Neue",Helvetica,Arial,sans-serif;
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

title, h1, h2, h3, h4 {
    font-family: 'Source Sans Pro', sans-serif;
}

div.xlink {
    display: inline
}

xlink {
    display: none;
}

hr {
    margin-top: 2rem;
    margin-bottom: 2rem;
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
    padding-left: 1rem;
    padding-right: 1rem;
    border-radius: 10px;
}

???|code-tag|.???|code-class| {
    padding: 0.1rem;
    font-family: julia_mono;
    font-size: 1.0rem;
    font-feature-settings: "zero", "ss01";
    font-variant-ligatures: contextual;
}

.hljs {
    white-space: pre-wrap;
    word-wrap: break-word;
    font-family: julia_mono;
    font-feature-settings: "zero", "ss01";
    font-size: 1.0rem;
    font-variant-ligatures: contextual;
}

code {
    font-family: julia_mono;
    font-feature-settings: "zero", "ss01";
    font-variant-ligatures: contextual;
}
