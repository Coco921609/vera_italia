plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.vera.italia.vera_italia"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    signingConfigs {
        create("release") {
            // Chemin sécurisé et absolu vers le keystore
            storeFile = file("${rootDir.absolutePath}/app/key.jks")
            storePassword = "kirollos"
            keyAlias = "key"
            keyPassword = "kirollos"
        }
    }

    defaultConfig {
        applicationId = "com.vera.italia.vera_italia"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        // --- GESTION DES VERSIONS ---
        // Augmentez le versionCode à chaque nouvelle publication sur Google Play
        versionCode = 8
        versionName = "8.0.0"
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}