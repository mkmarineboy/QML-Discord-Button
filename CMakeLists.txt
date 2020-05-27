cmake_minimum_required(VERSION 3.5)

project(DiscordButton LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt5 COMPONENTS Core Quick LinguistTools REQUIRED)

set(TS_FILES DiscordButton_en_US.ts)

add_executable(DiscordButton
  main.cpp
  qml.qrc
  ${TS_FILES}
)

target_compile_definitions(DiscordButton
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(DiscordButton
  PRIVATE Qt5::Core Qt5::Quick)

qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
