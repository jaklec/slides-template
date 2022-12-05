---
author: First Last &#58;&#58; MyCompany
title: Realjs Markdown Template 
subtitle: Markdown to HTML with Pandoc 
date: 2020-09-09
css: ./styles.css
---

# First Section

## Making slides

Reveal.js with Pandoc is awsome

:::{.fragment .fade-right}
This block is dynamic
:::

## Custom styling

:::{style="color: blue;"}
Feeling blue
:::

# Second section

Show me a quote

:::{.fragment}
> Someone once said...
:::

# Text

## Emphasized text

_I'm emphasized_

__And I'm bold__

## Code

Expression: `let x: i32 = 3 + 4;`

Code block (Javascript):
```javascript
const x = 3 + 4;

console.log(x);
```

Code block (Rust):
```rust
fn main() {
    // Print text to the console
    println!("Hello World!");
}
```

## Mermaid diagrams

```mermaid
sequenceDiagram
  participant Alice
  participant Bob
  Alice->>John: Hello John, how are you?
  Note right of John: Rational thoughts <br/>prevail!
  John-->>Alice: Great!
  John->>Bob: How about you?
  Bob-->>John: Jolly good!
```
