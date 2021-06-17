plugins {
    id("software.amazon.smithy") version "0.5.3"
    id("com.github.ben-manes.versions") version "0.39.0"
}

buildscript {
    dependencies {
        classpath("software.amazon.smithy:smithy-openapi:1.8.0")
        classpath("software.amazon.smithy:smithy-aws-traits:1.8.0")
    }

    repositories {
        mavenCentral()
    }
}

dependencies {
    implementation(libs.smithy.model)
    implementation(libs.smithy.aws.traits)
}

repositories {
    mavenCentral()
}
