#set page(
  paper: "us-letter",
  margin: (x: 30pt, y: 25pt),
)

#set text(
  size: 11pt,
  font: (
    "CMU Sans Serif",
    "TW-Kai",
    "FiraCode Nerd Font Propo"
  ),
)

#set block(
  spacing: 0.6em,
)

#set grid(
  row-gutter: 1em,
)

#let heading_color = rgb(100, 10, 10)

#show heading.where(level: 1): it => [
  #set text(
    fill: heading_color,
    weight: "bold",
    size: 24pt,
  )
  #block(
    it.body
  )
]

#show heading.where(level: 2): it => [
  #set text(
    fill: heading_color,
    weight: "bold",
    size: 16pt,
  )
  #block(above: 0.8em, below: 0.6em)[
    #it.body
  ]
]

#let item(leader, body) = {
  text[#leader: ]
  body
}

#let school(degree, school, time_start, time_end) = {
  block(spacing: 0pt)[
    #text(weight: "bold")[#degree] \@ #emph[#school]
    #h(1fr)
    #time_start -- #time_end
  ]
}

#let work(title, company, place, time_start, time_end) = {
  block[
    #emph[#company]
    #h(1fr)
    #place \
    #text(weight: "bold")[#title]
    #h(1fr)
    #time_start -- #time_end
  ]
}

#let project(title) = {
  block[
    #text(
      //style: "oblique",
      weight: "bold",
      size: 12pt,
    )[#underline[#title]]
  ]
}

#let title(name_en, name_zh, addr) = {
  block[
    #text(
      weight: "bold",
      size: 22pt,
      fill: heading_color,
    )[
      #name_en
    ]
    #h(10pt)
    #text(
      size: 20pt,
      fill: heading_color,
    )[
      #name_zh
    ]
    #h(1fr)
    #text(
      size: 13pt,
    )[
      #addr
    ]
  ]
}

#let info(email, phone, github, blog, linkedin) = {
    set text(font: "FiraCode Nerd Font Propo", size: 10pt)
    block[
      󰇮#h(0.5em)#link("mailto:" + email)[#email]
      #h(1fr)
      #h(0.5em)#phone
      #h(1fr)
      #h(0.5em)#link("https://github.com/" + github)[#github]
      #h(1fr)
      #h(0.5em)#link("https://" + blog)[#blog]
      #h(1fr)
      󰌻#h(0.5em)#link("https://www.linkedin.com/in/" + linkedin)[#linkedin]
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


#let main = {[
== Education
#grid[
  #school[M.S. in CS][New York University][01/2024][Exp 12/2025]
  - #item[GPA][3.8/4.0]
  // - #item[Courses][#underline[Compiler], #underline[Parallel Programming], 
  //   #underline[Operating Systems], #underline[Big Data App Dev], #underline[Multicore CPU Programming].]
  ][
  #school[B.E. in ECE][Shanghai Jiao Tong University][09/2019][08/2023]
  - #item[Core GPA][3.7/4.0]
  ]

== Technical Skills
- *Programming languages:* C++, C, Go, OCaml, Python, Java, SML, Scala, Shell, Elm.
- *Tools \& DevOps:* Git, Docker, Kubernetes, Nginx, Cloud (AWS, GCP), Hadoop, Spark, Kafka, Ray.
- *Databases:* MySQL, MariaDB, PostgreSQL, SQLite, MongoDB, Redis, Hive.

== Projects
#grid[
  #project[Parallel implementation of hash visualization algorithm]
  - Implemented a *work-efficient* parallel version of OpenSSH’s hash visualization algorithm using *OpenMP*.
  - Achieved *embarrassingly parallel pixel rendering*, improving performance linearly on multicore CPUs.
  - Applied *load-balancing* techniques to ensure scalability across different input sizes.
  ][
  #project[Infinite world -- The random map generation]
  - Implemented algorithm based on expression trees that generates Minecraft-like infinite maps
    using *procedural content generation* (PCG).
  - Parallelized the algorithm using *Rake-and-Compress* algorithm to reduce the span to $cal(O)(log n)$,
    where $n$ is the depth of the expression tree, hence accelerated the procedural generation speed.
  - Used *Raylib* to achieve a Minecraft-like game interface.
  ][
  #project[Compiler construction]
  - Built a compiler in *OCaml* that compiles from *ML-ish* code down to *RISC-V*.
  - Implemented a *type checker* that detects compile-time errors.
  - Used *Control Graph Analysis* for optimizations including constant propagation and dead-code elimination.
  ]

== Work Experience
#grid[
  #work[Full Stack Dev Intern][SuXiang Automobile Tech Ltd. (Startup)][Shanghai, China][08/2023][12/2023]
  - Developed a high-performance *single-page web app* using *Elm* (frontend), 
    *Go* with *Gin* (backend), and *MariaDB*.
  - Designed and deployed self-hosted infrastructure (mail server, Mattermost, Nextcloud) via *Docker*,
    enabling secure team collaboration. 
  - Automated *CI/CD* pipeline using Drone+Gitea,
    improving development and deployment efficiency.
  ][
  #work[Big Data Infrastructure Intern][Samoyed Cloud Tech, Ltd.][Shanghai, China][06/2022][09/2022]
  - Processed large-scale financial datasets on *HDFS* for distributed storage and computation.
  - Developed *Spark*-based ETL pipelines to clean, transform, and aggregate financial data for AI/ML training.
  - Integrated *Kafka* with *Spark Structured Streaming* for real-time data analysis.
  ]

]}

#let intro = {
  set par(justify: true)
  set text(style: "oblique", fill: heading_color)
  block(spacing: 0em)[
    Passionate Software Engineer with expertise in parallel computing and algorithms design.
    Deep understanding in OS, compilers, and distributed systems.
    Committed to building high-performance, reliable, and elegant solutions.
  ]
}

#grid(
  //rows: (auto, auto, auto),
  row-gutter: 1em,
  title[Yuxuan Zheng][郑宇轩][Jersey City, NJ],
  info("yx.zheng766@gmail.com", "(551)226-3046", "zyxdenny", "zhengyuxuan.xyz", "zyxdenny"),
  grid(
    row-gutter: 0.6em,
    intro,
    main,
  )
)


