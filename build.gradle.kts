plugins {
    alias(libs.plugins.smithy)
    id("com.github.ben-manes.versions") version "0.42.0"
}

buildscript {
    dependencies {
        classpath("software.amazon.smithy:smithy-openapi:1.22.0")
        classpath("software.amazon.smithy:smithy-aws-traits:1.22.0")
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
