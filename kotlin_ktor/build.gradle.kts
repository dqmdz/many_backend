plugins {
    kotlin("jvm") version "2.0.21"
    application
}

group = "com.example"
version = "1.0.0"

application {
    mainClass.set("com.example.ApplicationKt")
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("io.ktor:ktor-server-core:3.0.2")
    implementation("io.ktor:ktor-server-netty:3.0.2")
    implementation("io.ktor:ktor-server-content-negotiation:3.0.2")
    implementation("io.ktor:ktor-serialization-gson:3.0.2")
    implementation("io.ktor:ktor-server-cors:3.0.2")
    implementation("ch.qos.logback:logback-classic:1.5.12")

    implementation("org.jetbrains.exposed:exposed-core:0.48.0")
    implementation("org.jetbrains.exposed:exposed-jdbc:0.48.0")
    implementation("org.jetbrains.exposed:exposed-java-time:0.48.0")
    implementation("org.xerial:sqlite-jdbc:3.47.1.0")

    testImplementation("io.ktor:ktor-server-tests:3.0.2")
    testImplementation("org.jetbrains.kotlin:kotlin-test:2.0.21")
}
