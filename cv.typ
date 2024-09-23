#set page (
    paper: "us-letter",
    margin: (x: 35pt, y: 35pt),
)

#set text(
    size: 12pt,
    font: (
        "linux libertine",
        "TW-Kai",
        "Symbols Nerd Font"
    )
)

#show heading.where(level: 1): it => [
    #set text(
        fill: eastern,
        weight: "bold",
        size: 26pt,
    )
    #smallcaps(
        it.body
    )
    
]

#show heading.where(level: 2): it => [
    #set text(
        fill: eastern,
        weight: "bold",
        size: 18pt,
    )
    #block(
        it.body,
    )
]

#let item(leader, body) = {
    text(weight: "semibold")[#leader: ]
    body
}

#let school(degree, school, time_start, time_end) = {
    set text(
        size: 12pt,
    )
    block[
        #text(fill: black)[
            #emph[#degree] \@ #emph[#school]
            #h(1fr)
            #time_start -- #time_end
        ]
    ]
}

#let work(title, company, place, time_start, time_end) = {
    block[
        #text(
            size: 12pt,
        )[
            #emph[#company]
            #h(1fr)
            #place \
            #text(weight: "semibold")[#title]
            #h(1fr)
            #time_start -- #time_end
        ]
    ]
}

#let project(title) = {
    block[
        #text(
            size: 12pt,
        )[
            #text(weight: "semibold")[#title]
        ]
    ]
}

#let title(name_en, name_zh) = {
    set text(
        fill: eastern,
    )
    block[
        #text(
            weight: "bold",
            size: 26pt,
        )[
            #smallcaps(
                name_en,
            )
        ]
        #h(10pt)
        #text(
            size: 20pt,
        )[
            #name_zh
        ]
    ]
}

#let info(email, phone, github, blog, linkedin) = {
    set text(font: "JetBrains Mono", size: 10pt)
    block[
        󰇮 #h(1pt) #link("mailto:" + email)[#email]
        #h(1fr)
         #h(1pt) #phone
        #h(1fr)
         #h(1pt) #link("https://github.com/" + github)[#github]
        #h(1fr)
         #h(1pt) #link("https://" + blog)[#blog]
        // #h(1fr)
        // 󰌻 #h(1pt) #linkedin
    ]    
}


#let skills(class, sarray) = {
    let skill(s) = {
        set text(
            fill: white,
            size: 10pt,
            font: "JetBrains Mono",
        )
        box(
            fill: eastern,
            height: 15pt,
            radius: 5pt,
            inset: 5pt,
        )[
            #set align(center + horizon)
            #s
        ]
    }
    block[
        *#class* \
        #{
            for s in sarray {
                [#skill(s) #h(1pt)]
            } 
        }
    ] 
}


#let main = {block[
== Education
#school[M.S. in CS][New York Univerty][01/2024][Exp 12/2025]
- #item[GPA][3.8/4.0]
- #item[Courses][Algorithms, Programming Languages, Cloud \& Machine Learning, Operating Systems, Big Data Application Development, Multicore CPU]

#school[B.E. in CE][Shanghai Jiao Tong University][09/2019][08/2023]
- #item[Senior Year GPA][3.7/4.0]
- #item[Courses][Data Structures, Cryptography, Computer Organization, Discrete Math, Linear Algebra]
- #item[Awards][SJTU Scholarship Third Prize, Award of Academic Progress]

== Work Experience
#work[Full Stack Dev Intern][SuXiang Automobile Tech Ltd. (Startup)][Shanghai, China][08/2023][12/2023]
- Developed a high-performance #emph[single-page web app] using #emph[Elm] (frontend), #emph[Go] with #emph[Gin] (backend), and #emph[MariaDB] (database) to support 10 employees.
- Deployed mail server, Mattermost, and Nextcloud using #emph[Docker], integrating Authentik for #emph[SSO] management (LDAP, OAuth, SAML).
- Automated CI/CD pipeline using #emph[Drone] with Gitea, improving development and deployment efficiency.
- Implemented security measures including MFA, encrypted communication, and RBAC for better access control.
- Wrote documentation for system usage and SSO sign-in across services, simplifying employee onboarding.

#work[Data Analyst Intern][Samoyed Cloud Tech, Ltd.][Shanghai, China][06/2022][09/2022]
- Retrieved and analyzed large-scale datasets using #emph[Hive], optimizing data processing for actionable insights.
- Built clustering algorithm served as an extra feature to predict user risk. 
- Developed and optimized scripts in #emph[SQL] and #emph[Python], automating data extraction and transformation processes.

== Projects
#project[Million Song Dataset Analysis]
- Developed a music recommendation system on big data with #emph[Hadoop] and #emph[Spark].
- Parallelized BFS to search on the Million Song Dataset.
- Ensured flexibility and extensibility.
]}

#let side = {
block[
#set par(justify: true)
#emph["Passionate programmer with a deep love for cutting-edge technology and open-source software. Skilled in software development, data analysis, and DevOps, with a strong focus on building stable, efficient solutions."]
]
block[
#v(5pt)
== Skills
#skills([Programming Languages], ("C++", "C", "Go", "Python", "Shell", "Elm"))
#skills([Operating Systems], ("Linux", "MacOS"))
#skills([Tools \& DevOps], ("Git", "Docker", "Kubernetes", "CI/CD", "Cloud (AWS, GCP)", "Nginx"))
#skills([Database], ("MySQL", "Mariadb", "SQLite", "Hive"))
#skills([Documentaion \& Writing], ("LaTeX", "Typst", "Markdown"))
#skills([Big Data \& Distributed Systems], ("Hadoop", "Spark", "Ray", "Hive"))
#skills([Machine Learning \& AI], ("AI Signal Processing", "SVM", "CNN"))
#skills([Efficiency \& Extensibility], ("Vim", "Bash", "All in Linux"))
]
}

#let body = {
    grid(
        columns: (1fr, 2fr),
        column-gutter: 12pt,
        block(
            width: 100%,
            height: 93%,
            inset: 10pt,
            fill: luma(230),
            radius: 4pt,
        )[#side],
            main,
    )
}

#grid(
    rows: (auto, auto, auto),
    row-gutter: 12pt,
    title[Yuxuan Zheng][郑宇轩],
    info("yx.zheng766@gmail.com", "(551)226-3046", "zyxdenny", "yuxuanzheng.com", "zyxdenny.linkedin"),
    body,
)
