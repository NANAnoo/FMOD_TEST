#include <fmod.hpp>
#include <iostream>

#include <fmod.h>

int main() {

    // create system
    FMOD::System *system;
    auto res = FMOD::System_Create(&system, FMOD_VERSION);
    if (res != FMOD_OK) {
        std::cout << "system create failed" << std::endl;
        return 1;
    }

    // init system
    res = system->init(32, FMOD_INIT_NORMAL, nullptr);
    if (res != FMOD_OK) {
        // Handle error
        std::cout << "system init failed" << std::endl;
        system->release();
        return 1;
    }

    // create sound
    FMOD::Sound *sound;
    res = system->createSound("./sounds/test.wav", FMOD_DEFAULT, nullptr, &sound);
    if (res != FMOD_OK) {
        std::cout << "sound init failed" << std::endl;
        system->release();
        return 1;
    }

    // start playing the sound, get channel
    FMOD::Channel* channel;
    res = system->playSound(sound, nullptr, false, &channel);
    if (res != FMOD_OK) {
        std::cout << "sound play failed" << std::endl;
        system->release();
        sound->release();
        return 1;
    }

    // Wait for the sound to finish playing
    bool isPlaying = true;
    while (isPlaying) {
        channel->isPlaying(&isPlaying);
        system->update();
    }

    system->close();
    system->release();
    sound->release();
    return 0;
}