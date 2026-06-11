#!/usr/bin/env bun
import * as fs from "fs";
import * as path from "path";

// テスト用ファイル生成ディレクトリ
const TEST_DIR = "test-files";

// ディレクトリが存在しなければ作成
if (!fs.existsSync(TEST_DIR)) {
  fs.mkdirSync(TEST_DIR, { recursive: true });
}

// サンプルテキストのテンプレート
const sampleTexts = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "The quick brown fox jumps over the lazy dog.",
  "TypeScript is a typed superset of JavaScript.",
  "Bun is an all-in-one JavaScript runtime.",
  "This is a test file for git stash functionality.",
  "Testing file generation with random content.",
  "Generated on {date}.",
];

// 50個のテキストファイルを生成
for (let i = 1; i <= 50; i++) {
  const filename = `test-file-${i.toString().padStart(3, "0")}.txt`;
  const filepath = path.join(TEST_DIR, filename);

  // ランダムなサンプルテキストを選択
  const randomText =
    sampleTexts[Math.floor(Math.random() * sampleTexts.length)];
  const content = `${randomText}\nFile ID: ${i}\nGenerated at: ${new Date().toISOString()}\n`;

  fs.writeFileSync(filepath, content, "utf-8");
  console.log(`✓ Created: ${filepath}`);
}

console.log(`\n✅ Successfully generated 50 test files in '${TEST_DIR}' directory`);
