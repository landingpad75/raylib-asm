; Window functions
extern InitWindow               ; void InitWindow(int w, int h, const char* title)
extern SetTargetFPS             ; void SetTargetFPS(int fps)
extern WindowShouldClose        ; bool WindowShouldclose()
extern ToggleBorderlessWindowed ; void ToggleBorderlessWindowed()
extern GetFrameTime             ; float GetFrameTime

extern BeginDrawing             ; void BeginDrawing()
extern EndDrawing               ; void EndDrawing()

extern DrawFPS                  ; void DrawFPS(int x, int y)
extern DrawRectangle            ; void DrawRectangle(int x, int y, int w, int h, Color color)
extern DrawTriangle             ; void DrawTriangle(i forgot i'll do this once i get internet)
extern DrawLine                 ; void DrawLine(i also forgot this)
extern DrawText                 ; void DrawText(const char* text, int x, int y, int fontSize, Color color)

extern IsKeyDown                ; bool IsKeyDown(int key)
extern IsKeyPressed             ; bool IsKeyPressed(int key)

extern CloseWindow              ; void CloseWindow()
extern ClearBackground          ; void ClearBackground(Color color)

extern GetRandomValue           ; int GetRandomValue(int min, int max)

extern puts                     ; void puts(const char* str)