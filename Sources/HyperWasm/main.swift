import JavaScriptKit
import HyperSwift

// font-family: 'Trispace', sans-serif;
var trispaceFont: JSValue {
    var link = document.createElement!("link")
    link.rel = "stylesheet"
    link.href = "https://fonts.googleapis.com/css2?family=Trispace:wght@200;400;500;700&display=swap"
    return link
}

var header: HTMLElement {
    HStack(justify: .spaceBetween, align: .center) {
        Image(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Swift_logo.svg/1138px-Swift_logo.svg.png")
            .width(50)
            .height(50)
        Paragraph("HyperWasm")
            .font(weight: .sevenhundred, size: 40, family: "Trispace")
            .margin(5)
    }
    .padding(10)
    .backgroundColor(CSSColor("#c5dae0"))
}

var page: HTMLElement {
    Div {
        header
        HStack(justify: .spaceBetween, wrap: .wrap) {
            VStack(align: .center) {
                Paragraph("Editor")
                    .font(weight: .normal, size: 14, family: "Trispace")
                RawHTML(
                    """
                    <input id="inputPane" type="text">
                    </input>
                    """
                )
            }.minWidth(45, .percent)
    
            VStack(align: .center) {
                Paragraph("Renderer")
                    .font(weight: .normal, size: 14, family: "Trispace")
                Div {
                    RawHTML("<div id=\"help\"><p>Hello World!</p></div>")
                }.backgroundColor(CSSColor("#FFFFFF"))
                .height(90, .percent)
                .width(90, .percent)
            }.minWidth(45, .percent)
        }
        .margin(10)
        .height(80, .percent)
        .backgroundColor(CSSColor("#e0cdc5"))
    }
}

let document = JSObject.global.document.object!
let divElement = document.createElement!("div").object!

divElement.innerHTML = JSValue(stringLiteral: page.render())
let buttonElement = document.createElement!("button").object!

let reRender = JSClosure { _ in
    document.getElementById?("help").object?.innerHTML =
        JSValue(
            stringLiteral: SynthesizedComponent(
                document.getElementById?("inputPane").object?.value.description ?? ""
            )!.render()
        )
}

buttonElement.innerText = "Click me!"
buttonElement.onclick = .function(reRender)

let head = document.head
_ = head.appendChild(trispaceFont)

let body = document.body.object!
_ = body.appendChild!(head)
_ = body.appendChild!(divElement)

_ = body.appendChild!(buttonElement)
