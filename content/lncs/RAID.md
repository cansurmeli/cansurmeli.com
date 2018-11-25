---
title: "RAID"
slug: "raid"
date: 2018-11-25
tags: ["computer", "storage"]
draft: false
type: "lncs"
---
# RAID
Redundant array of independent disks.

With the exception of RAID 1 providing merely speed advantages, RAID systems fall into one of the two categories:
- either a complete mirror image of the data is kept on another drive,
- or parity blocks are added into the system so that failed blocks can be recovered.

## Provides
- fault tolerance
- redundancy
- speed

## Configurations
**Common:**
- RAID 0
- RAID 1
- RAID 5
- RAID 10

**Others:**
- RAID 2
- RAID 3
- RAID 4
- RAID 6
- RAID 50
- RAID 51
- RAID 53
- RAID 100

***remark:** For the below representations, assume each disk is 1TB.*

### RAID 0
|:------:|:------:|
|   A1   |   A2   |
|   A3   |   A4   |
|   A5   |   A6   |
|   A7   |   A8   |
| disk 0 | disk 1 |

- Uses a form of striping:
	- bit,
	- byte,
	- block,
- Much faster write performance BUT if one fails, all data is lost since the two disks were treated as a single logical drive.

### RAID 1
|:------:|:------:|
|   A1   |   A1   |
|   A2   |   A2   |
|   A3   |   A3   |
|   A4   |   A4   |
| disk 0 | disk 1 |

- Designed for liability,
- Clones everything in disk0 to disk1; therefore functions as a backup,
- If one fails:
	- the RAID controller will switch to the active one,
	- when the faulty drive gets changed, the RAID controller will clone the data into the new drive.

### RAID 2
|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
|   A1   |   A2   |   A3   |   A4   |   Ap1  |   Ap2  |   Ap3  |
|   B1   |   B2   |   B3   |   B4   |   Bp1  |   Bp2  |   Bp3  |
|   C1   |   C2   |   C3   |   C4   |   Cp1  |   Cp2  |   Cp3  |
|   D1   |   D2   |   D3   |   D4   |   Dp1  |   Dp2  |   Dp3  |
| disk 0 | disk 1 | disk 2 | disk 3 | disk 4 | disk 5 | disk 6 |

- Requires a minimum fo 3 drives to function,
- Data is striped at bit level,
- Disks d0...d3 MUST spin in sync,
- When data gets written:
	- it also calculates the error correction, also known as hamming code(ECC),
- good sequential read/write,
- bad random read/write,
- Since error codes are available in hard disk themselves, this RAID configuration is not used anymore.

### RAID 3
|:------:|:------:|:------:|:-------:|
|   A1   |   A2   |   A3   | Ap(1-3) |
|   A4   |   A5   |   A6   | Ap(4-6) |
|   B1   |   B2   |   B3   | Bp(1-3) |
|   B4   |   B5   |   B6   | bp(4-6) |
| disk 0 | disk 1 | disk 2 |  disk 3 |

- Data is striped at byte level,
- Disks d0...d2 must spin in sync,
- Requires a minimum of three disks to operate,
- Contains a parity disk,
- If one of the disks from d0...d2 fails, the parity disk as allows it to be reconstructed,
- Good sequential read/write,
- Bad random read/write,
- Maybe good for video editing,
- Not commonly used.

### RAID 4
|:------:|:------:|:------:|:------:|
|   A1   |   A2   |   A3   |   Ap   |
|   B1   |   B2   |   B3   |   Bp   |
|   C1   |   C2   |   C3   |   Cp   |
|   D1   |   D2   |   D3   |   Dp   |
| disk 0 | disk 1 | disk 2 | disk 3 |

- Striped at block level,
- Has a dedicated parity disk,
- Since striped:
	- good random read,
	- bad random write because it also has to write to parity,
- Does not require disk to spin in sync,
- Not very commonly used.

### RAID 5
|:------:|:------:|:------:|:------:|
|   A1   |   A2   |   A3   |   Ap   |
|   B1   |   B2   |   Bp   |   B3   |
|   C1   |   Cp   |   C2   |   C3   |
|   Dp   |   D1   |   D2   |   D3   |
| disk 0 | disk 1 | disk 2 | disk 3 |

- Does not have a dedicated parity drive; instead it distributes the parity sections,
- The same amount of space is lost to storing the parities BUT there is more space efficiency,
- The most cost effective solution,
- Good performance because of block level striping,
- Parity storage => slow write,
- Good for databases.

### RAID 6
|:------:|:------:|:------:|:------:|--------|
|   A1   |   A2   |   A3   |   Ap   | Aq     |
|   B1   |   B2   |   Bp   |   Bq   | B3     |
|   C1   |   Cp   |   Cq   |   C2   | C3     |
|   Dp   |   Dq   |   D1   |   D2   | D3     |
| disk 0 | disk 1 | disk 2 | disk 3 | disk 4 |

- Dual parity,
	- distributed across disks,
	- therefore useful in scenarios where there are a lot more disks than in the diagram above where two disks can fail at the same time.
- Uses block striping.

### RAID 10(1+0)
- RAID 0(RAID 1 + RAID 1)
- Very efficient,
- Highly regarded.

## Disadvantages of RAID:
- storage needs increase:
	- prevention of data loss is mitigated at the cost of increasing the amount of storage,
	- mirroring doubles the storage amount,
	- depends but parity mostly consumes one fifth of the total storage,
- performance penalties:
	- writing an updated block involves two write operations, and the parity may require blocks from all of the drives in a set to be read,
- when a drive fails and it doesn't have a replacement in the system, initially, that drive needs to be replaced.

## Resources
- [https://www.youtube.com/watch?v=wTcxRObq738&t=0s&list=WL&index=27](https://www.youtube.com/watch?v=wTcxRObq738&t=0s&list=WL&index=27)
- [https://www.networkcomputing.com/storage/raid-vs-erasure-coding/1792588127](https://www.networkcomputing.com/storage/raid-vs-erasure-coding/1792588127)
