plugins {
    alias(libs.plugins.smithy)
}

buildscript {
    dependencies {
        classpath("software.amazon.smithy:smithy-openapi:1.26.2")
        classpath("software.amazon.smithy:smithy-aws-traits:1.26.2")
    }

    repositories {
        mavenCentral()
    }
}

dependencies {
    implementation(libs.smithy.model)
    implementation(libs.smithy.linters)
    implementation(libs.smithy.aws.traits)
}

repositories {
    mavenCentral()
}
