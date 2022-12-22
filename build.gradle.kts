plugins {
    alias(libs.plugins.smithy)
}

buildscript {
    dependencies {
        classpath("software.amazon.smithy:smithy-openapi:1.27.0")
        classpath("software.amazon.smithy:smithy-aws-traits:1.27.0")
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
